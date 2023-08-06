import 'package:flutter/material.dart';
import 'package:parking_espe/src/paginas/HomePage.dart';

class CustomDrawer extends StatefulWidget {
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int _paginaActual = 0;

  void _onDrawerItemTap(int index) {
    setState(() {
      _paginaActual = index;
      Navigator.pop(context);

      if(index == 1){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container( // Wrap the drawer content with a Container for the background
        color: Color.fromARGB(255, 115, 220, 89),
        child: Column(
          children: [
           DrawerHeader(
  decoration: BoxDecoration(),
  child: Column(
     // Alinea el texto a la izquierda
    children: [
      Container(
        width: 80,
        height: 80,
        child: Image.asset('assets/page-1/images/whatsappimage2023-05-22at2117-1-Sym.png'),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Text("Adrian Guevara"),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Text('+593 0996976917'),
      ),
    ],
  ),
),

            _buildListTile(Icons.local_parking, "Aparcar", 0),
            _buildListTile(Icons.favorite, "Reservar", 1),
            _buildListTile(Icons.shopping_bag, "Comparar", 2),
            _buildListTile(Icons.wallet_giftcard_sharp, "Promociones", 3),
            _buildListTile(Icons.list, "Movimientos", 4),
            _buildListTile(Icons.local_parking, "Tus estacionamientos", 5),
            Expanded(child: Container()), // Use Expanded to push the BottomNavigationBar to the bottom
            BottomNavigationBar(
              onTap: _onDrawerItemTap,
              currentIndex: _paginaActual,
              selectedIconTheme: IconThemeData(color: Color.fromARGB(255, 115, 220, 89),), // Cambia el color del ícono seleccionado a azul
              selectedLabelStyle: TextStyle(color: Color.fromARGB(255, 115, 220, 89),),
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.confirmation_num), label: "Configuración"),
                BottomNavigationBarItem(icon: Icon(Icons.login), label: "Login"),
                BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Logout"),
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
