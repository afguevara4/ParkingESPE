import 'package:flutter/material.dart';
import 'package:parking_espe/src/paginas/drawer.dart';
import '../../utils.dart';

class Profile extends StatelessWidget {
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
            onPressed: (){
              //Navigator.push(
                  //context,
                  //MaterialPageRoute(builder: (context) => LoginPage()),
                //);
            }
          )
        ],
      ),
      drawer: Drawer(
        child: CustomDrawer(),
      ),
      body:Container(
        width: double.infinity,
        child: SingleChildScrollView( //Ajustar la pantalla
      child: Container(
        // perfilXKD (64:294)
        padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 129.6*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffc4d5c0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupdncoqqh (SMiHFfwnB9UGijQC4Qdnco)
              width: double.infinity,
              height: 418.91*fem,
              child: Stack(
                children: [
                  Positioned(
                    // image5aoH (64:295)
                    left: 0*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 579*fem,
                        height: 363*fem,
                        child: Image.asset(
                          'assets/page-1/images/image-5.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // perfilJDV (64:296)
                    left: 180*fem,
                    top: 313*fem,
                    child: Align(
                      child: SizedBox(
                        width: 63*fem,
                        height: 33*fem,
                        child: Text(
                          'Perfil',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont (
                            'Nunito',
                            fontSize: 24*ffem,
                            fontWeight: FontWeight.w800,
                            height: 1.3625*ffem/fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // txtpaisPu9 (64:316)
                    left: 0*fem,
                    top: 344*fem,
                    child: Container(
                      width: 430*fem,
                      height: 64.91*fem,
                      decoration: BoxDecoration (
                        color: Color(0xffc4d5c0),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            // usuariohuq (64:318)
                            left: 22*fem,
                            top: 25.2735900879*fem,
                            child: Align(
                              child: SizedBox(
                                width: 51*fem,
                                height: 20*fem,
                                child: Text(
                                  'Usuario',
                                  style: SafeGoogleFont (
                                    'Nunito',
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.3625*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // afguevara4gmailcomz8F (64:319)
                            left: 22*fem,
                            top: 39.6335754395*fem,
                            child: Align(
                              child: SizedBox(
                                width: 175*fem,
                                height: 22*fem,
                                child: Text(
                                  'afguevara4@gmail.com',
                                  style: SafeGoogleFont (
                                    'Nunito',
                                    fontSize: 16*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.3625*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
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
              // txtpaisGbZ (64:320)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0.19*fem),
              width: double.infinity,
              height: 64.91*fem,
              decoration: BoxDecoration (
                color: Color(0xffc4d5c0),
              ),
              child: Stack(
                children: [
                  Positioned(
                    // nombresyapellidosCEK (64:322)
                    left: 22*fem,
                    top: 25.2735862732*fem,
                    child: Align(
                      child: SizedBox(
                        width: 134*fem,
                        height: 20*fem,
                        child: Text(
                          'Nombres y apellidos',
                          style: SafeGoogleFont (
                            'Nunito',
                            fontSize: 14*ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.3625*ffem/fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // adrianguevarajimenezHFm (64:323)
                    left: 22*fem,
                    top: 39.6335792542*fem,
                    child: Align(
                      child: SizedBox(
                        width: 179*fem,
                        height: 22*fem,
                        child: Text(
                          'Adrian Guevara Jimenez',
                          style: SafeGoogleFont (
                            'Nunito',
                            fontSize: 16*ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.3625*ffem/fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupyta3P3u (SMiHRVzjfJ4pjSwgzcYtA3)
              width: 436*fem,
              height: 328.4*fem,
              child: Stack(
                children: [
                  Positioned(
                    // txtpais6j1 (64:324)
                    left: 0*fem,
                    top: 65*fem,
                    child: Container(
                      width: 430*fem,
                      height: 69.12*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // rectangle1Qjh (64:325)
                            left: 0*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 430*fem,
                                height: 64.91*fem,
                                child: Container(
                                  decoration: BoxDecoration (
                                    color: Color(0xffc4d5c0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // tefefono8Qo (64:326)
                            left: 22*fem,
                            top: 30.0455169678*fem,
                            child: Align(
                              child: SizedBox(
                                width: 57*fem,
                                height: 20*fem,
                                child: Text(
                                  'Tefefono',
                                  style: SafeGoogleFont (
                                    'Nunito',
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.3625*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // 31y (64:327)
                            left: 22*fem,
                            top: 47.1168518066*fem,
                            child: Align(
                              child: SizedBox(
                                width: 139*fem,
                                height: 22*fem,
                                child: Text(
                                  '+593 0996976917',
                                  style: SafeGoogleFont (
                                    'Nunito',
                                    fontSize: 16*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.3625*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // txtpaiswd9 (64:312)
                    left: 0*fem,
                    top: 0*fem,
                    child: Container(
                      width: 430*fem,
                      height: 71.18*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // rectangle1U7H (64:313)
                            left: 0*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 430*fem,
                                height: 64.91*fem,
                                child: Container(
                                  decoration: BoxDecoration (
                                    color: Color(0xffc4d5c0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // contraseaBGb (64:314)
                            left: 22*fem,
                            top: 34.8229026794*fem,
                            child: Align(
                              child: SizedBox(
                                width: 75*fem,
                                height: 20*fem,
                                child: Text(
                                  'Contraseña',
                                  style: SafeGoogleFont (
                                    'Nunito',
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.3625*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // sQK (64:315)
                            left: 22*fem,
                            top: 49.1835289001*fem,
                            child: Align(
                              child: SizedBox(
                                width: 51*fem,
                                height: 22*fem,
                                child: Text(
                                  '*******',
                                  style: SafeGoogleFont (
                                    'Nunito',
                                    fontSize: 16*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.3625*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // txtpaisN6B (64:340)
                    left: 6*fem,
                    top: 195*fem,
                    child: Container(
                      width: 430*fem,
                      height: 69.11*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // rectangle16Xy (64:341)
                            left: 0*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 430*fem,
                                height: 64.91*fem,
                                child: Container(
                                  decoration: BoxDecoration (
                                    color: Color(0xffc4d5c0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // tustarjetasd27 (64:342)
                            left: 22*fem,
                            top: 32.7090454102*fem,
                            child: Align(
                              child: SizedBox(
                                width: 76*fem,
                                height: 20*fem,
                                child: Text(
                                  'Tus tarjetas',
                                  style: SafeGoogleFont (
                                    'Nunito',
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.3625*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // gestionatustajetasdecrditodbit (64:343)
                            left: 22*fem,
                            top: 47.1079406738*fem,
                            child: Align(
                              child: SizedBox(
                                width: 278*fem,
                                height: 22*fem,
                                child: Text(
                                  'Gestiona tus tajetas de crédito/débito',
                                  style: SafeGoogleFont (
                                    'Nunito',
                                    fontSize: 16*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.3625*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // txtpaisnZD (64:348)
                    left: 0*fem,
                    top: 260*fem,
                    child: Container(
                      width: 430*fem,
                      height: 68.4*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // rectangle1hgB (64:349)
                            left: 0*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 430*fem,
                                height: 64.91*fem,
                                child: Container(
                                  decoration: BoxDecoration (
                                    color: Color(0xffc4d5c0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // darmedebaja1B5 (64:350)
                            left: 28*fem,
                            top: 32*fem,
                            child: Align(
                              child: SizedBox(
                                width: 95*fem,
                                height: 20*fem,
                                child: Text(
                                  'Darme de baja',
                                  style: SafeGoogleFont (
                                    'Nunito',
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.3625*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // eliminartucuentaparkingespe6TR (64:351)
                            left: 28*fem,
                            top: 46.3988952637*fem,
                            child: Align(
                              child: SizedBox(
                                width: 236*fem,
                                height: 22*fem,
                                child: Text(
                                  'Eliminar tu cuenta ParkingESPE',
                                  style: SafeGoogleFont (
                                    'Nunito',
                                    fontSize: 16*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.3625*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // txtpaisYKR (64:344)
                    left: 0*fem,
                    top: 130*fem,
                    child: Container(
                      width: 430*fem,
                      height: 68.93*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // rectangle1ThH (64:345)
                            left: 0*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 430*fem,
                                height: 64.91*fem,
                                child: Container(
                                  decoration: BoxDecoration (
                                    color: Color(0xffc4d5c0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // tusvehiculosNpF (64:346)
                            left: 22*fem,
                            top: 32.5724029541*fem,
                            child: Align(
                              child: SizedBox(
                                width: 87*fem,
                                height: 20*fem,
                                child: Text(
                                  'Tus vehiculos',
                                  style: SafeGoogleFont (
                                    'Nunito',
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.3625*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // gestioantusvehiculos5Tm (64:347)
                            left: 22*fem,
                            top: 46.9330444336*fem,
                            child: Align(
                              child: SizedBox(
                                width: 168*fem,
                                height: 22*fem,
                                child: Text(
                                  'Gestioan tus vehiculos',
                                  style: SafeGoogleFont (
                                    'Nunito',
                                    fontSize: 16*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.3625*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      )
      )
     );
  }
}
