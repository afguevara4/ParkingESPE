import 'package:flutter/material.dart';
import 'package:parking_espe/src/paginas/Profile.dart';
import 'package:parking_espe/src/paginas/Welcome.dart';
import 'package:parking_espe/src/paginas/WelcomeOff.dart';
import 'package:parking_espe/src/paginas/Reservar.dart';
import 'package:parking_espe/src/paginas/movimientos.dart';
import 'package:parking_espe/src/paginas/reservar_time.dart';
import 'package:parking_espe/src/paginas/settings.dart';
import 'package:provider/provider.dart';
import '../read data/getIdUser.dart';

class CustomDrawer extends StatefulWidget {
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int _paginaActual = 0;

  void _onDrawerItemTap(int index) {
    Navigator.pop(context);

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Profile()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Settings()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomeOff()),
      );
    }

    switch (index) {
      case 3:
        // Navegar a la pantalla de Aparcar
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Welcome()),
        );
        break;
      case 4:
        // Navegar a la pantalla de Aparcar
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CalendarScreen()),
        );
        break;
      case 5:
        // Navegar a la pantalla de Aparcar
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Reservar()),
        );
        break;
      case 6:
        // Navegar a la pantalla de Aparcar
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Reservar()),
        );
        break;
      case 7:
        // Navegar a la pantalla de Aparcar
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => movimientos()),
        );
        break;
      case 8:
        // Navegar a la pantalla de Aparcar
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Reservar()),
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(userIdProvider.userName),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('+593 ${userIdProvider.userPhone}'),
                  ),
                ],
              ),
            ),
            _buildListTile(Icons.local_parking, "Aparcar", 3),
            _buildListTile(Icons.favorite, "Reservar", 4),
            _buildListTile(Icons.shopping_bag, "Comparar", 5),
            _buildListTile(Icons.wallet_giftcard_sharp, "Promociones", 6),
            _buildListTile(Icons.list, "Movimientos", 7),
            _buildListTile(Icons.local_parking, "Tus estacionamientos", 8),
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
                    icon: Icon(Icons.person), label: "Perfil"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "Configuracion"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.logout),
                    label: "Logout" // aplicar el cerrar sesion
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(IconData iconData, String title, int index) {
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: Icon(iconData),
        title: Text(title),
        onTap: () => _onDrawerItemTap(index),
      ),
    );
  }
}
