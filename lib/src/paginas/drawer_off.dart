import 'package:flutter/material.dart';
import 'package:parking_espe/src/paginas/HomePage.dart';
import 'package:parking_espe/src/paginas/Profile.dart';
import 'package:parking_espe/src/paginas/SettingsOff.dart';
import 'package:parking_espe/src/paginas/WelcomeOff.dart';
import 'package:parking_espe/src/paginas/Ayuda.dart';
import 'package:parking_espe/src/paginas/settings.dart';
import 'package:provider/provider.dart';
import '../read data/getIdUser.dart';

class CustomDrawerOff extends StatefulWidget {
  @override
  State<CustomDrawerOff> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawerOff> {
  int _paginaActual = 0;

  void _onDrawerItemTap(int index) {
    Navigator.pop(context);

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SettingsOff()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomeOff()),
      );
    } else if (index == 1) {
      // Navegar a la pantalla de Ayuda (rfac)
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FAQScreen()), // Asegúrate de crear RfacScreen
      );
    }

    switch (index) {
      case 3:
        // Navegar a la pantalla del croquis
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomeOff()),
        );
        break;
      case 4:
        // Navegar a la pantalla de benieficios de la aplicacion
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomeOff()),
        );
        break;
      case 8:
        // Navegar a la pantalla de Aparcar
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final userIdProvider = Provider.of<UserIdProvider>(context, listen: false);
    userIdProvider.getUserData();

    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 115, 220, 89),
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child: Image.asset(
                        'assets/page-1/images/whatsappimage2023-05-22at2117-1-Sym.png'),
                  ),
                ],
              ),
            ),
            _buildListTile(Icons.local_parking, "Aparcar", 3),
            _buildListTile(Icons.favorite, "Reservar", 4),
            _buildListTile(Icons.local_parking, "Iniciar Sesion", 8),
            Spacer(),
            BottomNavigationBar(
              onTap: _onDrawerItemTap,
              currentIndex: _paginaActual,
              selectedIconTheme:
                  IconThemeData(color: Color.fromARGB(255, 115, 220, 89)),
              selectedLabelStyle:
                  TextStyle(color: Color.fromARGB(255, 115, 220, 89)),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "Configuraciones"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.help), label: "Ayuda"), // Cambio de título
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(IconData iconData, String title, int index) {
    Color tileColor =
        Colors.white; // Color por defecto para la mayoría de los elementos
    if (index == 8) {
      // Si es el índice correspondiente a "Iniciar Sesión"
      tileColor =
          Color.fromARGB(255, 240, 136, 57); // Cambiar el color del fondo
    }

    return Container(
      color: tileColor,
      child: ListTile(
        leading: Icon(
          iconData,
          color: index == 8 ? Colors.white : Color.fromARGB(255, 115, 220, 89),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: index == 8 ? Colors.white : Colors.black87,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: () => _onDrawerItemTap(index),
      ),
    );
  }
}
