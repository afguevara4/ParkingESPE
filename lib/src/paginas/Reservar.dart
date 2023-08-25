import 'package:flutter/material.dart';
import 'package:parking_espe/src/models/Reserve.dart';
import 'package:parking_espe/src/models/PersonaReserva.dart';
import 'package:parking_espe/src/models/SpaceParking.dart';
import 'package:parking_espe/src/paginas/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parking_espe/src/read%20data/getIdUser.dart';
import 'package:provider/provider.dart';

class Reservar extends StatefulWidget {
  @override
  _ReservarState createState() => _ReservarState();
}

class _ReservarState extends State<Reservar> {
  List<SpaceParking> spaces = [];
  int selectedRow = -1;
  int selectedCol = -1;
  int selectedSpaceIndex = -1; // Agregar esto en el estado
  Reserve? reserve;

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
    loadReserve();
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

  Future<void> updateSpaceStatusAndDeleteReserve(
      String spaceId, String newStatus, String reserveIdToDelete) async {
    CollectionReference spacesCollection =
        FirebaseFirestore.instance.collection('ParkingSpaces');
    DocumentReference spaceDocRef = spacesCollection.doc(spaceId);
    spaceDocRef.update({
      'estado': newStatus,
    });
    CollectionReference reserveCollection =
        FirebaseFirestore.instance.collection('Reserve');
    DocumentReference reserveDocRef = reserveCollection.doc(reserveIdToDelete);
    reserveDocRef.delete();
    reserve = null;
    loadSpaces();

    print('Estado del espacio actualizado en Firebase y reserva eliminada.');
  }

  // Future<void> insertReserve() async {}

  Future<void> loadSpaces() async {
    List<SpaceParking> loadedSpaces = await getSpacesFromFirebase();

    // Ordenar los espacios por el campo "numero"
    loadedSpaces.sort((a, b) => a.numero.compareTo(b.numero));

    setState(() {
      spaces = loadedSpaces;
    });
  }

  Future<void> loadReserve() async {
    final userIdProvider = Provider.of<UserIdProvider>(context, listen: false);
    String userId = userIdProvider.userId;
    if (userId != null && userId.isNotEmpty) {
      Reserve? loadReserve =
          await getReserveByUserId(userId); // Nota el tipo Reserve? aquí

      if (loadReserve != null) {
        setState(() {
          reserve = loadReserve;
        });
      }
    }
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

  Future<Reserve?> getReserveByUserId(String idUser) async {
    try {
      QuerySnapshot reserveQuery = await FirebaseFirestore.instance
          .collection('Reserve')
          .where('idUser', isEqualTo: idUser)
          .get();

      if (reserveQuery.docs.isNotEmpty) {
        QueryDocumentSnapshot reserveDoc = reserveQuery.docs.first;
        Reserve reserve = Reserve(
          id: reserveDoc.id,
          date: reserveDoc['date'].toDate(),
          idParking: reserveDoc['idParking'],
          idUser: reserveDoc['idUser'],
          status: reserveDoc['status'],
        );

        return reserve;
      } else {
        return null;
      }
    } catch (error) {
      print('Error al obtener la reserva: $error');
      return null;
    }
  }

  Color ObtenerColor(SpaceParking space, int col) {
    if (space.estado == "Libre") {
      if (selectedRow == space.numero && selectedCol == col && reserve == null)
        return Colors.green;
      else {
        return Colors.blue;
      }
    } else if (space.estado == "Asignado") {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  Future<PersonaReserva?> obtenerUserReserve(String idParking) async {
    try {
      QuerySnapshot reserveQuery = await FirebaseFirestore.instance
          .collection('Reserve')
          .where('idParking', isEqualTo: idParking)
          .get();
      if (reserveQuery.docs.isNotEmpty) {
        QueryDocumentSnapshot reserveDoc = reserveQuery.docs.first;
        String idUser = reserveDoc['idUser'];
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
            .collection(
                'Users') // Cambia por el nombre de tu colección de estacionamientos
            .doc(
                idUser) // Aquí debes proporcionar el identificador del estacionamiento
            .get();
        if (userSnapshot.exists) {
          Map<String, dynamic> userDoc =
              userSnapshot.data() as Map<String, dynamic>;
          PersonaReserva persona = PersonaReserva(
            nombre: userDoc['Nombre'],
            correo: userDoc['Correo'],
            telefono: userDoc['Telefono'],
            placa: userDoc['Placa'],
          );
          print(persona.nombre);
          return persona;
        } else {
          return null;
        }
      }
    } catch (error) {
      print('Error al obtener la reserva: $error');
      return null;
    }
    return null;
  }

  Future<void> createReserve(String idParking, String idUser) async {
    try {
      // Obtener la fecha actual
      DateTime currentDate = DateTime.now();
      // Crear un nuevo documento en la colección "Reserve" con un ID automático
      await FirebaseFirestore.instance.collection('Reserve').add({
        'date': currentDate,
        'idParking': idParking,
        'idUser': idUser,
        'status': 'Reservado',
      });

      loadReserve();

      // La reserva se ha creado con éxito
      print('Reserva creada con éxito');
    } catch (error) {
      // Ocurrió un error al crear la reserva
      print('Error al crear la reserva: $error');
    }
  }

//Funcion que genera 100 espacios en la base d edatos de firebase
  // Future<void> addSpacesToFirebase() async {
  //   CollectionReference spacesCollection =
  //       FirebaseFirestore.instance.collection('ParkingSpaces');

  //   for (int i = 101; i <= 250; i++) {
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
    final userIdProvider = Provider.of<UserIdProvider>(context);

    // Llama a getUserData para obtener los datos del usuario
    userIdProvider.getUserData();
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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                      const Text("Libre",
                          style: TextStyle(color: Colors.black)),
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
                      const Text("Asignado",
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                      child: ListView.builder(
                    itemCount: (spaces.length / 10).ceil(),
                    itemBuilder: (BuildContext context, int rowIndex) {
                      int startIndex = rowIndex * 10;
                      int endIndex = (startIndex + 10) <= spaces.length
                          ? (startIndex + 10)
                          : spaces.length;

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int j = startIndex; j < endIndex; j++)
                            GestureDetector(
                              onTap: () {
                                toggleSelection(spaces[j].numero, j);
                                selectedSpaceIndex = spaces[j].numero;
                                if (spaces[j].estado == "Asignado") {
                                  obtenerUserReserve(spaces[j].id)
                                      .then((persona) => {
                                            if (persona != null)
                                              {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      backgroundColor: Colors
                                                              .green[
                                                          200], // Fondo verde claro
                                                      title: Text(
                                                        "Información del Dueño del Lugar",
                                                        style: TextStyle(
                                                          color: Colors
                                                              .white, // Letras negras
                                                        ),
                                                      ),
                                                      content: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            "Nombre: ${persona.nombre}",
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black, // Letras negras
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Placa Vehiculo: ${persona.placa}",
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black, // Letras negras
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Telefono: ${persona.telefono}",
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black, // Letras negras
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Correo: ${persona.correo}",
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black, // Letras negras
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      actions: [
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary: Colors
                                                                .green, // Botón de color azul
                                                          ),
                                                          child: Text(
                                                            "Aceptar",
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .white, // Letras blancas en el botón
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                )
                                              }
                                          });
                                }
                                if (reserve != null) {
                                  if (spaces[j].estado != "Asignado") {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor: Colors.green[200],
                                            title: const Text("ALERTA!"),
                                            content: const Text(
                                                "Usted ya tiene parqueadero reservado!"),
                                            actions: [
                                              //Mostrar otro boton en base a una condicion
                                              if (userIdProvider.userId ==
                                                      reserve!.idUser &&
                                                  reserve!.idParking ==
                                                      spaces[j].id)
                                                ElevatedButton.icon(
                                                  onPressed: () {
                                                    updateSpaceStatusAndDeleteReserve(
                                                        spaces[selectedSpaceIndex -
                                                                1]
                                                            .id,
                                                        "Libre",
                                                        reserve!.id);
                                                    Navigator.of(context).pop();
                                                  },
                                                  icon: const Icon(Icons.delete,
                                                      color: Colors
                                                          .white), // Agregar el icono de eliminar
                                                  label: const Text(
                                                      "Eliminar Reserva"),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    foregroundColor:
                                                        Colors.white,
                                                    backgroundColor: Colors
                                                        .red, // Cambiar el color del texto a blanco
                                                  ),
                                                ),

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
                                } else if (spaces[j].estado == "Libre") {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.green[200],
                                          title: Text(
                                            "ALERTA!",
                                            style: TextStyle(
                                              color:
                                                  Colors.white, // Letras negras
                                            ),
                                          ),
                                          content: const Text(
                                              "¿Desea Reservar este espacio?"),
                                          actions: [
                                            //Mostrar otro boton en base a una condicion
                                            if (reserve == null)
                                              ElevatedButton.icon(
                                                onPressed: () {
                                                  if (selectedSpaceIndex !=
                                                      -1) {
                                                    String selectedSpaceId =
                                                        spaces[selectedSpaceIndex -
                                                                1]
                                                            .id;
                                                    createReserve(
                                                        selectedSpaceId,
                                                        userIdProvider.userId);
                                                    updateSpaceStatus(
                                                        selectedSpaceId,
                                                        'Reservado');
                                                    Navigator.of(context).pop();
                                                    //Mostrar la alerta
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            backgroundColor:
                                                                Colors
                                                                    .green[200],
                                                            title: Text(
                                                              "RESERVA EXITOSA",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white, // Letras negras
                                                              ),
                                                            ),
                                                            content: Text(
                                                                "Has reservado el parqueadero #${selectedSpaceIndex}"),
                                                            actions: [
                                                              ElevatedButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: const Text(
                                                                    "Aceptar"),
                                                              ),
                                                            ],
                                                          );
                                                        });
                                                  }
                                                },
                                                icon: const Icon(Icons.check,
                                                    color: Colors
                                                        .white), // Agregar el icono de eliminar
                                                label: const Text("Si"),
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor: Colors.white,
                                                  backgroundColor: Colors
                                                      .green, // Cambiar el color del texto a blanco
                                                ),
                                              ),

                                            ElevatedButton.icon(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              icon: const Icon(Icons.delete,
                                                  color: Colors.white),
                                              label: const Text("No"),
                                            ),
                                          ],
                                        );
                                      });
                                }
                              },
                              child: Container(
                                width: 33,
                                height: 35,
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: ObtenerColor(spaces[j], j),
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
                      );
                    },
                  )),
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
                  // ElevatedButton(
                  //     onPressed: () {
                  //       if (selectedSpaceIndex != -1) {
                  //         String selectedSpaceId =
                  //             spaces[selectedSpaceIndex - 1].id;
                  //         createReserve(selectedSpaceId, userIdProvider.userId);
                  //         updateSpaceStatus(selectedSpaceId, 'Reservado');

                  //         //Mostrar la alerta
                  //         showDialog(
                  //             context: context,
                  //             builder: (BuildContext context) {
                  //               return AlertDialog(
                  //                 title: const Text("Reserva Exitosa"),
                  //                 content: Text(
                  //                     "Has reservado el parqueadero #${selectedSpaceIndex}"),
                  //                 actions: [
                  //                   ElevatedButton(
                  //                     onPressed: () {
                  //                       Navigator.of(context).pop();
                  //                     },
                  //                     child: const Text("Aceptar"),
                  //                   ),
                  //                 ],
                  //               );
                  //             });
                  //       }
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       padding: const EdgeInsets.symmetric(
                  //           horizontal: 32, vertical: 16),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(
                  //             25), // Ajusta este valor para cambiar la curvatura del borde
                  //       ),
                  //       backgroundColor: const Color.fromARGB(255, 115, 220, 89),
                  //     ),
                  //     child: const Text("Reservar")),
                ],
              ),
            ),
          ),
        ));
  }
}
