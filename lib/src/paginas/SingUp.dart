import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cargoController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController placaController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ValidationpasswordController = TextEditingController();

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
          _buildTextField(passwordController, 'Password', Icons.lock, obscureText: true),
          SizedBox(height: 15),
          _buildTextField(ValidationpasswordController, 'Password', Icons.lock, obscureText: true),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              // Aquí puedes realizar acciones con los datos ingresados (nombre, cargo y contraseña)
              print('Nombre: ${nameController.text}');
              print('Cargo: ${cargoController.text}');
              print('Correo: ${correoController.text}');
              print('Telefono: ${telefonoController.text}');
              print('Contraseña: ${passwordController.text}');
              print('ValContraseña: ${ValidationpasswordController.text}');
              
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
