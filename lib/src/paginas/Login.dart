import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parking_espe/src/read%20data/getIdUser.dart';
import 'package:provider/provider.dart';

import 'Welcome.dart';

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
              backgroundColor: const Color.fromARGB(
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

  void _loginUser(String email, String password) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('Correo', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var userDoc = querySnapshot.docs[0];
        String storedPassword = userDoc['Password'];

        if (password == storedPassword) {
          String newUserId = userDoc.id; // Obtener el ID del usuario

          Provider.of<UserIdProvider>(context, listen: false)
              .updateUserId(newUserId);

          setState(() {
            // Resto de tu código de actualización de estado
          });

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Welcome()));
        } else {
          setState(() {
            // Resto de tu código para contraseña incorrecta
          });
        }
      } else {
        setState(() {
          // Resto de tu código para usuario no encontrado
        });
      }
    } catch (e) {
      print('Error al intentar iniciar sesión: $e');
    }
  }
}
