import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 40),
          Text(
            'Log In',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text('Welcome to Parking ESPE',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          _buildTextField(nameController, 'User Name', Icons.person),
          SizedBox(height: 16),
          _buildTextField(passwordController, 'Password', Icons.lock, obscureText: true),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Aquí puedes realizar acciones con los datos ingresados (nombre y contraseña)
              print('Nombre: ${nameController.text}');
              print('Contraseña: ${passwordController.text}');
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
          borderRadius: BorderRadius.circular(17),
        ),
      ),
    );
  }
}
