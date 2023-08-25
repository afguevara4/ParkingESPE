import 'package:flutter/material.dart';
import 'package:parking_espe/src/paginas/drawer_off.dart';

class WelcomeOff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 510;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 115, 220, 89),
        centerTitle: true,
        title: Text("¿Dónde quieres aparcar?",
            style: TextStyle(color: Colors.black)),
      ),
      drawer: Drawer(
        child: CustomDrawerOff(),
      ),
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 46 * fem,
              child: Align(
                child: SizedBox(
                    width: MediaQuery.of(context)
                        .size
                        .width, // Ancho de la pantalla
                    height: 923 * fem,
                    child: InteractiveViewer(
                      maxScale: 10.0,
                      minScale: 0.5,
                      child: Image.asset(
                        'assets/page-1/images/Croquis2.png',
                        fit: BoxFit.contain,
                        alignment: Alignment.topCenter,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
