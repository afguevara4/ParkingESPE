import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserIdProvider extends ChangeNotifier {
  String userId = ''; // Inicializa o actualiza esto según cómo estás almacenando el userId
  String userEmail = ''; // Variable para almacenar el correo electrónico
  String userName = ''; // Variable para almacenar el Nombre
  String userPhone = ''; // Variable para almacenar el Telefono
  String userPlaca = ''; // Variable para almacenar el Telefono
  

  void updateUserId(String newUserId) {
    userId = newUserId;
    notifyListeners();
  }

  Future<void> getUserData() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userSnapshot =
          await FirebaseFirestore.instance.collection('Users').doc(userId).get();

      if (userSnapshot.exists) {
        Map<String, dynamic> userData = userSnapshot.data()!;
        userEmail = userData['Correo']; // Obtén el correo electrónico del usuario
        userName = userData['Nombre'];
        userPhone = userData['Telefono'];
        userPlaca = userData['Placa'];
      }
    } catch (e) {
      print('Error al obtener los datos del usuario: $e');
    }
  }
}
