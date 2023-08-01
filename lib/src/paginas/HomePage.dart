import 'package:flutter/material.dart';
import 'Login.dart';
import 'SingUp.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedButton = 0; // Variable para guardar el índice del botón seleccionado

  // Lista de widgets que se mostrarán debajo de cada botón
  List<Widget> pageWidgets = [
    LoginPage(), // Índice 0: Información para el botón "home"
    SignUpPage(), // Índice 1: Información para el botón "mail"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildFloatingActionButton(0, Icons.login),
                SizedBox(width: 16),
                buildFloatingActionButton(1, Icons.app_registration),
              ],
            ),
            SizedBox(height: 16),
            IndexedStack(
              index: selectedButton,
              children: pageWidgets,
            ),
          ],
        ),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton(int buttonIndex, IconData icon) {
    Color color = selectedButton == buttonIndex ? Color.fromARGB(255, 115, 220, 89) : Colors.grey; // Cambiar el color según el botón seleccionado
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          selectedButton = buttonIndex;
        });
      },
      backgroundColor: color,
      child: Icon(icon),
    );
  }
}
