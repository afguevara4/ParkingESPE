import 'package:flutter/material.dart';

void main() => runApp(SingUp());

class SingUp extends StatelessWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ParkingESPE",
      home: Inicio(),
    );
  }
}


class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _Inicio();
}

class _Inicio extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ParkinESPE"),
      ),
      body:Center(
        child: Stack(
          children: [
            SizedBox(
              height: 300.0, //altura de la imagen
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/fondo.jpg",
                fit: BoxFit.contain),
            ),
            
          ],
        ) 
      )
      );
  }
}



