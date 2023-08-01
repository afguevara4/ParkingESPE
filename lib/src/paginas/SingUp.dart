import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cargoController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController placaController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController validationpasswordController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 1),
          Text(
            'Registrarse',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          _buildTextField(nameController, 'Full Name', Icons.person),
          SizedBox(height: 15),
          _buildTextField(cargoController, 'Charge', Icons.work),
          SizedBox(height: 15),
          _buildTextField(correoController, 'E-mail', Icons.mail),
          SizedBox(height: 15),
          _buildTextField(telefonoController, 'Phone', Icons.phone),
          SizedBox(height: 15),
          _buildTextField(placaController, 'Placa', Icons.lock, obscureText: true),
          SizedBox(height: 15),
          _buildTextField(passwordController, 'Password', Icons.lock, obscureText: true),
          SizedBox(height: 15),
          _buildTextField(validationpasswordController, 'Password', Icons.lock, obscureText: true),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              print('Enviando Datos ...');
              registroUsuario();
              // Aquí puedes realizar acciones con los datos ingresados (nombre, cargo y contraseña)
              print('Nombre: ${nameController.text}');
              print('Cargo: ${cargoController.text}');
              print('Correo: ${correoController.text}');
              print('Telefono: ${telefonoController.text}');
              print('Placa: ${placaController.text}');
              print('Contraseña: ${passwordController.text}');
              print('ValContraseña: ${validationpasswordController.text}');
              
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25), // Ajusta este valor para cambiar la curvatura del borde
              ),
              backgroundColor: Color.fromARGB(255, 115, 220, 89) , // Cambia el color de fondo del botón aquí
            ),
            child: Text('Ingresar', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool obscureText = false}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
