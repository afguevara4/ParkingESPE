import 'package:flutter/material.dart';
import 'package:parking_espe/src/paginas/drawer.dart';

class Parqueaderos extends StatefulWidget {
  @override
  _ParqueaderosState createState() => _ParqueaderosState();
}

class _ParqueaderosState extends State<Parqueaderos> {
  List<List<bool>> isSelected = List.generate(7, (i) => List.filled(10, false));

  void toggleSelection(int row, int col) {
    setState(() {
      isSelected[row][col] = !isSelected[row][col];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 115, 220, 89),
        centerTitle: true,
        title: Text("Reserva lo mejor para ti!!", style: TextStyle(color: Colors.black)),
      ),
      drawer: Drawer(
        child: CustomDrawer(),
      ),
      body: Container( // Agregar un contenedor para el fondo
      decoration: BoxDecoration(
        // Configurar el fondo aquí
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 115, 220, 89), Colors.white], // Puedes cambiar los colores
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 7; i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int j = 0; j < 10; j++)
                    GestureDetector(
                      onTap: () {
                        toggleSelection(i, j);
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: isSelected[i][j] ? Colors.green : Colors.blue,
                          border: Border.all(color: Colors.black),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: (){
                
              }, 
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    25), // Ajusta este valor para cambiar la curvatura del borde
              ),
              backgroundColor: const Color.fromARGB(255, 115, 220, 89),
              ),
              child: 
                Text("Reservar")
              ),
          ],
        ),
      ),
    ),
    );
  }
}
