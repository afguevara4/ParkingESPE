import 'package:flutter/material.dart';
import 'package:parking_espe/src/models/SpaceParking.dart';
import 'package:parking_espe/src/paginas/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Reservar extends StatefulWidget {
  @override
  _ReservarState createState() => _ReservarState();
}

class _ReservarState extends State<Reservar> {
  List<SpaceParking> spaces = [];
  int selectedRow = -1;
  int selectedCol = -1;
  int selectedSpaceIndex = -1; // Agregar esto en el estado

  void toggleSelection(int row, int col) {
    setState(() {
      if (selectedRow == row && selectedCol == col) {
        selectedRow = -1; // Deselect the current space
        selectedCol = -1;
      } else {
        selectedRow = row;
        selectedCol = col;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    print("Estado imprimiendose");
    loadSpaces();
  }

  Future<void> updateSpaceStatus(String spaceId, String newStatus) async {
    CollectionReference spacesCollection =
        FirebaseFirestore.instance.collection('ParkingSpaces');

    await spacesCollection.doc(spaceId).update({
      'estado': newStatus,
    });
    loadSpaces();
    print('Estado del espacio actualizado en Firebase');
  }

  Future<void> loadSpaces() async {
    List<SpaceParking> loadedSpaces = await getSpacesFromFirebase();

    // Ordenar los espacios por el campo "numero"
    loadedSpaces.sort((a, b) => a.numero.compareTo(b.numero));

    setState(() {
      spaces = loadedSpaces;
    });
  }

  Future<List<SpaceParking>> getSpacesFromFirebase() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('ParkingSpaces').get();

    List<SpaceParking> spaces = [];

    snapshot.docs.forEach((doc) {
      // Suponiendo que cada documento tiene campos 'numero', 'estado' e 'id'
      int numero = doc['numero'];
      String estado = doc['estado'];
      String id = doc.id;
      spaces.add(SpaceParking(id: id, numero: numero, estado: estado));
    });

    return spaces;
  }
// Funcion que genera 100 espacios en la base d edatos de firebase
  // Future<void> addSpacesToFirebase() async {
  //   CollectionReference spacesCollection =
  //       FirebaseFirestore.instance.collection('ParkingSpaces');

  //   for (int i = 1; i <= 100; i++) {
  //     // Crear un nuevo documento en la colección con el número y estado correspondientes
  //     await spacesCollection.add({
  //       'numero': i,
  //       'estado': 'Libre', // Puedes ajustar el estado según tus necesidades
  //     });
  //   }

  //   print('Se agregaron 96 espacios a Firebase');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 115, 220, 89),
        centerTitle: true,
        title: const Text("Reserva lo mejor para ti!!",
            style: TextStyle(color: Colors.black)),
      ),
      drawer: Drawer(
        child: CustomDrawer(),
      ),
      body: Container(
        // Agregar un contenedor para el fondo
        decoration: const BoxDecoration(
          // Configurar el fondo aquí
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 115, 220, 89),
              Colors.white
            ], // Puedes cambiar los colores
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    margin: const EdgeInsets.only(right: 5),
                  ),
                  const Text("Libre", style: TextStyle(color: Colors.black)),
                  const SizedBox(width: 15),
                  Container(
                    width: 15,
                    height: 15,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    margin: const EdgeInsets.only(right: 5),
                  ),
                  const Text("Reservado",
                      style: TextStyle(color: Colors.black)),
                  const SizedBox(width: 15),
                  Container(
                    width: 15,
                    height: 15,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    margin: const EdgeInsets.only(right: 5),
                  ),
                  const Text("Asignado", style: TextStyle(color: Colors.black)),
                ],
              ),
              const SizedBox(height: 20),
              for (int i = 0; i < spaces.length; i += 10) // Avanzar de 10 en 10
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int j = i; j < i + 10 && j < spaces.length; j++)
                      GestureDetector(
                        onTap: () {
                          toggleSelection(spaces[j].numero, j);
                          selectedSpaceIndex = spaces[j].numero;
                        },
                        child: Container(
                          width: 33,
                          height: 35,
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: (spaces[j].estado == "Libre")
                                ? ((selectedRow == spaces[j].numero &&
                                        selectedCol == j)
                                    ? Colors.green
                                    : Colors.blue)
                                : Colors.red,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Text(
                              '${spaces[j].numero}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              const SizedBox(height: 20),
              // Boton Para Generar spacios en este caso del 1 al 100,
              // ElevatedButton(
              //   onPressed: () {
              //     addSpacesToFirebase();
              //   },
              //   style: ElevatedButton.styleFrom(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(25),
              //     ),
              //     backgroundColor: const Color.fromARGB(255, 115, 220, 89),
              //   ),
              //   child: const Text("Agregar Espacios"),
              // ),
              ElevatedButton(
                  onPressed: () {
                    if (selectedSpaceIndex != -1) {
                      String selectedSpaceId =
                          spaces[selectedSpaceIndex - 1].id;
                      updateSpaceStatus(selectedSpaceId, 'Reservado');
                      //Mostrar la alerta
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Reserva Exitosa"),
                              content: Text(
                                  "Has reservado el parqueadero #${selectedSpaceIndex}"),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Aceptar"),
                                ),
                              ],
                            );
                          });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          25), // Ajusta este valor para cambiar la curvatura del borde
                    ),
                    backgroundColor: const Color.fromARGB(255, 115, 220, 89),
                  ),
                  child: const Text("Reservar")),
            ],
          ),
        ),
      ),
    );
  }
}
