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
    double screenHeight = MediaQuery.of(context).size.height;
    double containerHeight = screenHeight / 2;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/fondo.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 500,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: containerHeight, // Altura deseada del contenedor
              margin: EdgeInsets.all(16), // Margen interno para el espacio blanco alrededor del contenido
              padding: EdgeInsets.all(16), // Ajusta el padding según lo que necesites
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSquareButton(0, Icons.login, "Log In"), // Agregamos el texto al botón de Log In
                      SizedBox(width: 20), // Espacio entre los botones
                      buildSquareButton(1, Icons.app_registration, "Sign Up"), // Agregamos el texto al botón de Sign Up
                    ],
                  ),
                  SizedBox(height: 0),
                  Expanded(
                    child: ListView(
                      children: [
                        pageWidgets[selectedButton],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSquareButton(int buttonIndex, IconData icon, String text) {
    Color color = selectedButton == buttonIndex ? Color.fromARGB(255, 115, 220, 89) : const Color.fromARGB(255, 111, 110, 110); // Cambiar el color según el botón seleccionado
    return RawMaterialButton(
      onPressed: () {
        setState(() {
          selectedButton = buttonIndex;
        });
      },
      elevation: 2.0,
      fillColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30), // Aumentamos el tamaño del icono a 30
            SizedBox(height: 8), // Espacio entre el icono y el texto
            Text(text, style: TextStyle(fontSize: 10)), // Aumentamos el tamaño del texto a 14
          ],
        ),
      ),
    );
  }
}
