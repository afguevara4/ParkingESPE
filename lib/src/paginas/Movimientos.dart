import 'package:flutter/material.dart';
import 'drawer.dart';
import 'package:parking_espe/src/read%20data/getIdUser.dart';
import 'package:provider/provider.dart';

class movimientos extends StatelessWidget {
  const movimientos({super.key});

  @override
  Widget build(BuildContext context) {
    // Accede a la instancia de UserIdProvider utilizando Provider.of
    final userIdProvider = Provider.of<UserIdProvider>(context);

    // Llama a getUserData para obtener los datos del usuario
    userIdProvider.getUserData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 115, 220, 89),
        centerTitle: true,
        title: Text("Movimientos", style: TextStyle(color: Colors.black)),
      ),
      drawer: Drawer(
        child: CustomDrawer(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Datos Personales",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Column(
              children: [
                Text("Nombre: " + userIdProvider.userName,
                    style: const TextStyle(fontSize: 16)),
                Text("Placa: " + userIdProvider.userPlaca,
                    style: const TextStyle(fontSize: 16)),
                Text("Telefono: " + userIdProvider.userPhone,
                    style: const TextStyle(fontSize: 16)),
                Text("Correo: " + userIdProvider.userEmail,
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 20), // Espacio entre los grupos de datos
            Column(
              children: [
                Text("Telefono: " + userIdProvider.userPhone,
                    style: const TextStyle(fontSize: 16)),
                Text("Correo: " + userIdProvider.userEmail,
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
            // Puedes seguir agregando más Column con sus respectivos grupos de Text widgets
          ],
        ),
      ),
    );
  }
}
