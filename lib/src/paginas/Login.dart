import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'BasicPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController e_mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Variable para mantener el estado de la validación del email
  bool isEmailValid = true;
  bool isPasswordValid = true;

  // Mensaje de error para el email
  String emailErrorMessage = '';
  String passwordErrorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 0),
          Column(
            children: [
              _buildTextField(e_mailController, 'E-mail', Icons.person),
              SizedBox(height: 8),
              if (!isEmailValid)
                Text(
                  emailErrorMessage,
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
          SizedBox(height: 8),
          _buildTextField(passwordController, 'Password', Icons.lock,
              obscureText: true),
          SizedBox(height: 8),
          if (!isPasswordValid)
            Text(
              passwordErrorMessage,
              style: TextStyle(color: Colors.red),
            ),
          ElevatedButton(
            onPressed: () {
              String email = e_mailController.text.trim();
              String password = passwordController.text.trim();

              if (isValidEmail(email)) {
                // El email es válido, puedes realizar acciones con los datos ingresados (email y contraseña)
                print('E_mail: $email');
                print('Contraseña: ${password}');
                // Reiniciar el mensaje de error en caso de que esté mostrándose actualmente
                setState(() {
                  isEmailValid = true;
                  emailErrorMessage = '';
                  isPasswordValid = true;
                  passwordErrorMessage = '';
                });

                _loginUser(email, password);
              } else {
                // El email no es válido, mostrar el mensaje de error
                setState(() {
                  isEmailValid = false;
                  emailErrorMessage = 'Email incorrecto';
                });
              }
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    25), // Ajusta este valor para cambiar la curvatura del borde
              ),
              backgroundColor: Color.fromARGB(
                  255, 115, 220, 89), // Cambia el color de fondo del botón aquí
            ),
            child: Text('Ingresar', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon,
      {bool obscureText = false}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(17),
        ),
        contentPadding: EdgeInsets.symmetric(
            vertical: 16, horizontal: 20), // Adjust the padding as needed
      ),
    );
  }

  // Función de validación de email
  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  // Función para iniciar sesión con Firebase
  void _loginUser(String email, String password) async {
    try {
      // Buscar el usuario en la colección "Users" de Firestore
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('Correo', isEqualTo: email)
          .get();

      // Si se encontró un usuario con el correo electrónico proporcionado
      if (querySnapshot.docs.isNotEmpty) {
        // Obtener el primer documento del resultado (asumimos que no hay duplicados de correos electrónicos)
        var userDoc = querySnapshot.docs[0];

        // Obtener la contraseña almacenada en Firestore
        String storedPassword = userDoc['Password'];

        // Verificar si la contraseña proporcionada coincide con la almacenada en Firestore
        if (password == storedPassword) {
          // Contraseña correcta, inicio de sesión exitoso
          print('Inicio de sesión exitoso. E_mail: $email');

          // Reiniciar el mensaje de error en caso de que esté mostrándose actualmente
          setState(() {
            isEmailValid = true;
            emailErrorMessage = '';
            isPasswordValid = true;
            passwordErrorMessage = '';
          });

          // Navegar a la página básica
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => BasicPage()));
        } else {
          // Contraseña incorrecta, mostrar un mensaje de error
          setState(() {
            isPasswordValid = false;
            passwordErrorMessage = 'Contraseña incorrecta';
          });
        }
      } else {
        // No se encontró un usuario con el correo electrónico proporcionado, mostrar un mensaje de error
        setState(() {
          isEmailValid = false;
          emailErrorMessage = 'Usuario no encontrado. Por favor, regístrese.';
        });
      }
    } catch (e) {
      print('Error al intentar iniciar sesión: $e');
    }
  }
}
