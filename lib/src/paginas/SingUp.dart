import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'HomePage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPage createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cargoController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController placaController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController validationpasswordController =
      TextEditingController();

  final firebase = FirebaseFirestore.instance;

  registroUsuario() async {
    try {
      await firebase.collection('Users').doc().set({
        "Nombre": nameController.text,
        "Cargo": cargoController.text,
        "Correo": correoController.text,
        "Telefono": telefonoController.text,
        "Placa": placaController.text,
        "Password": passwordController.text,
        "PasswordVal": validationpasswordController.text
      });
    } catch (e) {
      print("ERROR..." + e.toString());
    }
  }

  // Variable para mantener el estado de la validación del email
  bool isEmailValid = true;
  bool isNameValid = true;
  bool isCargoValid = true;
  bool isTelefonoValid = true;
  bool isPlacaValid = true;
  bool isPasswordValid = true;

  bool allFieldsValid = false;

  // Mensaje de error para el email
  String emailErrorMessage = '';
  String nameErrorMessage = '';
  String cargoErrorMessage = '';
  String telefonoErrorMessage = '';
  String placaErrorMessage = '';
  String passwordErrorMessage = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 0),
            _buildTextField(nameController, 'Full Name', Icons.person),
            SizedBox(height: 0),
            if (!isNameValid)
              Text(
                nameErrorMessage,
                style: TextStyle(color: Colors.red),
              ),
            _buildTextField(cargoController, 'Charge', Icons.work),
            SizedBox(height: 0),
            if (!isNameValid)
              Text(
                cargoErrorMessage,
                style: TextStyle(color: Colors.red),
              ),
            _buildTextField(correoController, 'E-mail', Icons.mail),
            SizedBox(height: 0),
            if (!isEmailValid)
              Text(
                emailErrorMessage,
                style: TextStyle(color: Colors.red),
              ),
            _buildTextField(telefonoController, 'Phone', Icons.phone),
            SizedBox(height: 0),
            if (!isTelefonoValid)
              Text(
                telefonoErrorMessage,
                style: TextStyle(color: Colors.red),
              ),
            _buildTextField(placaController, 'Placa', Icons.directions_car),
            SizedBox(height: 0),
            if (!isPlacaValid)
              Text(
                placaErrorMessage,
                style: TextStyle(color: Colors.red),
              ),
            _buildTextField(passwordController, 'Password', Icons.lock,
                obscureText: true),
            SizedBox(height: 0),
            _buildTextField(
                validationpasswordController, 'Password', Icons.lock,
                obscureText: true),
            SizedBox(height: 0),
            if (!isPasswordValid)
              Text(passwordErrorMessage, style: TextStyle(color: Colors.red)),
            ElevatedButton(
              onPressed: () {
                String email = correoController.text.trim();
                String name = nameController.text.trim();
                String cargo = cargoController.text.trim();
                String telefono = telefonoController.text.trim();
                String placa = placaController.text.trim();
                String password = passwordController.text;
                String validationPassword = validationpasswordController.text;

                if (isValidEmail(email) &&
                    isValidName(name) &&
                    isValidName(cargo) &&
                    isValidPhone(telefono) &&
                    isValidPlaca(placa)) {
                  if (password == validationPassword) {
                    // Las contraseñas coinciden, continuar con el registro
                    // El email es válido, puedes realizar acciones con los datos ingresados (email y contraseña)
                    print('E_mail: $email');
                    print('Nombre: ${nameController.text}');
                    print('Cargo: ${cargoController.text}');
                    print('Correo: ${correoController.text}');
                    print('Telefono: ${telefonoController.text}');
                    print('Placa: ${placaController.text}');
                    print('Contraseña: ${passwordController.text}');
                    print(
                        'ValContraseña: ${validationpasswordController.text}');
                    // Reiniciar el mensaje de error en caso de que esté mostrándose actualmente
                    setState(() {
                      isEmailValid = true;
                      isNameValid = true;
                      isCargoValid = true;
                      isTelefonoValid = true;
                      isPlacaValid = true;
                      emailErrorMessage = '';
                      nameErrorMessage = '';
                      cargoErrorMessage = '';
                      telefonoErrorMessage = '';
                      placaErrorMessage = '';
                    });

                    registroUsuario();

                    // Navegar de vuelta a la página de inicio de sesión
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  } else {
                    // Las contraseñas no coinciden, mostrar un mensaje de error
                    setState(() {
                      isPasswordValid = false;
                      passwordErrorMessage = 'Las contraseñas no coinciden';
                    });
                  }
                } else {
                  // Mostrar mensajes de error según la validación fallida
                  if (!isValidEmail(email)) {
                    setState(() {
                      isEmailValid = false;
                      emailErrorMessage = 'Email incorrecto';
                    });
                  }
                  if (!isValidName(name)) {
                    // Mostrar el mensaje de error para el campo de nombre
                    // Puedes adaptar este mensaje de acuerdo a tus necesidades
                    setState(() {
                      isNameValid = false;
                      nameErrorMessage =
                          'Nombre incorrecto. Solo se permiten letras.';
                    });
                  }
                  if (!isValidName(cargo)) {
                    // Mostrar el mensaje de error para el campo de nombre
                    // Puedes adaptar este mensaje de acuerdo a tus necesidades
                    setState(() {
                      isCargoValid = false;
                      cargoErrorMessage =
                          'Cargo incorrecto. Solo se permiten letras.';
                    });
                  }
                  if (!isValidName(telefono)) {
                    // Mostrar el mensaje de error para el campo de nombre
                    // Puedes adaptar este mensaje de acuerdo a tus necesidades
                    setState(() {
                      isTelefonoValid = false;
                      telefonoErrorMessage = 'Telefono incorrecto.';
                    });
                  }
                  if (!isValidName(placa)) {
                    // Mostrar el mensaje de error para el campo de nombre
                    // Puedes adaptar este mensaje de acuerdo a tus necesidades
                    setState(() {
                      isPlacaValid = false;
                      placaErrorMessage = 'Placa no valida.';
                    });
                  }
                }
                print('Enviando Datos ...');
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor: Color.fromARGB(255, 115, 220, 89),
              ),
              child: Text('Registrarse', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
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
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20), // Ajusta el tamaño de los campos de texto
      ),
    );
  }

  // Función de validación de email
  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  // Función de validación de nombre (solo letras)
  bool isValidName(String name) {
    final RegExp nameRegex = RegExp(r'^[a-zA-Z]+$');
    return nameRegex.hasMatch(name);
  }

  // Función de validación de numero de telefono
  bool isValidPhone(String phoneNumber) {
    final RegExp phoneRegex = RegExp(r'^\d{10}$');
    return phoneRegex.hasMatch(phoneNumber);
  }

  // Función de validación de placa)
  bool isValidPlaca(String licensePlate) {
    final RegExp plateRegex = RegExp(r'^[A-Z0-9]{3,}$');
    return plateRegex.hasMatch(licensePlate);
  }
}
