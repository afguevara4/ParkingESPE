import 'package:flutter/material.dart';
import 'package:parking_espe/src/paginas/drawer_off.dart';
import '../../utils.dart';

class SettingsOff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(210, 30, 30, 30),
        actions: [
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                //Navigator.push(
                //context,
                //MaterialPageRoute(builder: (context) => LoginPage()),
                //);
              })
        ],
      ),
      drawer: Drawer(
        child: CustomDrawerOff(),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            // configuracinTwd (62:154)
            padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 7 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffc4d5c0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  // autogroupkazmhd1 (SMiFKZVvDVPS7343U2kaZM)
                  width: double.infinity,
                  height: 476 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // image5R3D (63:185)
                        left: 0 * fem,
                        top: 0 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 579 * fem,
                            height: 363 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0x998d8d8d),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/page-1/images/image-5-bg.png',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // configuracinsvo (62:182)
                        left: 132.5 * fem,
                        top: 313 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 158 * fem,
                            height: 33 * fem,
                            child: Text(
                              'Configuración',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Nunito',
                                fontSize: 24 * ffem,
                                fontWeight: FontWeight.w800,
                                height: 1.3625 * ffem / fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // txtpaisTR9 (63:235)
                        left: 0 * fem,
                        top: 344 * fem,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                              22 * fem, 44 * fem, 22 * fem, 24 * fem),
                          width: 430 * fem,
                          height: 113 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xffc4d5c0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // paisdeestacioanmientovpX (63:237)
                                'Pais de estacionamiento',
                                style: SafeGoogleFont(
                                  'Nunito',
                                  fontSize: 18 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.3625 * ffem / fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                              Text(
                                // ecuadorUzT (63:250)
                                'Ecuador',
                                style: SafeGoogleFont(
                                  'Nunito',
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.3625 * ffem / fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // autogroup5z7hcas (SMiFdoUXMz7w3T4zeC5z7H)
                  width: double.infinity,
                  height: 207 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // txtpaiskwy (63:251)
                        left: 0 * fem,
                        top: 0 * fem,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                              22 * fem, 44 * fem, 22 * fem, 24 * fem),
                          width: 430 * fem,
                          height: 113 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xffc4d5c0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // idiomadelaaplicacinSZu (63:253)
                                'Idioma de la aplicación',
                                style: SafeGoogleFont(
                                  'Nunito',
                                  fontSize: 18 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.3625 * ffem / fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                              Text(
                                // espaolyJw (63:254)
                                'Español',
                                style: SafeGoogleFont(
                                  'Nunito',
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.3625 * ffem / fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        // txtpaisVHH (63:259)
                        left: 0 * fem,
                        top: 94 * fem,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                              22 * fem, 44 * fem, 22 * fem, 24 * fem),
                          width: 430 * fem,
                          height: 113 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xffc4d5c0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // universidadxgf (63:261)
                                'Universidad',
                                style: SafeGoogleFont(
                                  'Nunito',
                                  fontSize: 18 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.3625 * ffem / fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                              Text(
                                // espe6H5 (63:262)
                                'ESPE',
                                style: SafeGoogleFont(
                                  'Nunito',
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.3625 * ffem / fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // txtpaisRq9 (63:267)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 126 * fem),
                  padding: EdgeInsets.fromLTRB(
                      22 * fem, 44 * fem, 22 * fem, 24 * fem),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffc4d5c0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // mododevisualizacinvmu (63:269)
                        'Modo de visualización',
                        style: SafeGoogleFont(
                          'Nunito',
                          fontSize: 18 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.3625 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                      ),
                      Text(
                        // modooscurorfZ (63:270)
                        'Modo oscuro',
                        style: SafeGoogleFont(
                          'Nunito',
                          fontSize: 14 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.3625 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // v10zmm (63:191)
                  width: double.infinity,
                  child: Text(
                    'v1.0',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Nunito',
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.3625 * ffem / fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
