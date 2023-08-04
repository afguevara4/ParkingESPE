import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Básica'),
      ),
      body: Center(
        child: Text('Has iniciado sesión de manera correcta'),
      ),
    );
  }
}
