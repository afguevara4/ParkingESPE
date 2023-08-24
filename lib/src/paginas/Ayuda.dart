import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FAQScreen extends StatefulWidget {
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> with TickerProviderStateMixin {
  final List<QuestionAnswer> faqData = [
    QuestionAnswer(
      question: '¿Cómo creo una cuenta?',
      answer: 'Puedes crear una cuenta yendo a la página de registro...',
    ),
    QuestionAnswer(
      question: '¿Cómo saber si ya tiene dueño el lugar de parqueadero?',
      answer:
          'Puedes entrar a reservar y ver los colores que detallan cada uno',
    ),
    QuestionAnswer(
      question: '¿Cómo editar la información de mi cuenta?',
      answer: 'Puedes editar tu información yendo a la sección de perfil...',
    ),
    QuestionAnswer(
      question: '¿Cómo restablecer mi contraseña?',
      answer:
          'Para restablecer tu contraseña, ve a la página de inicio de sesión...',
    ),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 3,
        vsync: this,
        initialIndex: 0); // Set initialIndex to 0 for FAQ tab
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 115, 220, 89),
        centerTitle: true,
        title: const Text("Ayuda",
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
      ),
      extendBody: true,
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 115, 220, 89), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildFAQPage(),
              _buildContactsPage(),
              _buildCreatorsPage(),
            ].map((Widget page) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(25, 115, 220, 89), Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: page,
              );
            }).toList(),
          )),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 115, 220, 89), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          items: <Widget>[
            Icon(Icons.question_answer, size: 30),
            Icon(Icons.contacts, size: 30),
            Icon(Icons.people, size: 30), // Agrega este ícono
          ],
          onTap: (index) {
            setState(() {
              _tabController.animateTo(index);
            });
          },
        ),
      ),
    );
  }

  Widget _buildFAQPage() {
    return ListView.builder(
      itemCount: faqData.length,
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text(faqData[index].question),
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(faqData[index].answer),
            ),
          ],
        );
      },
    );
  }

  Widget _buildContactsPage() {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.email),
          title: Text("Contactanos por email"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Dudas, incidencias, reservas abiertas"),
              Text("denniscaisa@gmail.com"), // Segundo número de teléfono
            ],
          ),
          // Agrega el código para enviar un correo electrónico
          onTap: () {
            // Agrega el código para abrir una aplicación de correo con el destinatario y asunto predefinidos
          },
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text("Contáctanos por teléfono"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Nuestros hararios de oficina son los deias laborables 8:00-19:00"),
              Text(
                  "Fuera de horario laboral se atenderá via WhatsApp") // Segundo número de teléfono
            ],
          ),
          // Agrega el código para hacer una llamada telefónica
          onTap: () {
            // Agrega el código para iniciar una llamada telefónica
          },
        ),
        ListTile(
          leading: Icon(FontAwesomeIcons.whatsapp),
          title: Text("WhatsApp"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("+593 98 710 5359"),
              Text("+593 99 697 6917"), // Segundo número de teléfono
            ],
          ),
          // Agrega el código para abrir una conversación de WhatsApp
          onTap: () {
            // Agrega el código para abrir WhatsApp con un mensaje predefinido
          },
        ),
        ListTile(
          leading: Icon(Icons.social_distance),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Redes Sociales"),
              Text("Puedes saber más de nosotros en las redes"),
            ],
          ),
          subtitle: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.facebook), // Ícono de Facebook
              SizedBox(width: 10), // Espacio entre íconos
              Icon(FontAwesomeIcons.youtube), // Ícono de Twitter
              SizedBox(width: 10), // Espacio entre íconos
              Icon(FontAwesomeIcons.instagram), // Ícono de Instagram
              // Agrega más íconos según tus necesidades
            ],
          ),
          // Agrega un código para abrir perfiles en redes sociales
          onTap: () {
            // Agrega el código para abrir enlaces a perfiles en redes sociales
          },
        ),
      ],
    );
  }
}

Widget _buildCreatorsPage() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(
              "assets/page-1/images/Croquis2.png"), // Ruta de la imagen del creador 1
          radius: 50,
        ),
        SizedBox(height: 10),
        Text("Creador 1"), // Nombre del creador 1
        SizedBox(height: 20),
        CircleAvatar(
          backgroundImage: AssetImage(
              "assets/page-1/images/Croquis2.png"), // Ruta de la imagen del creador 2
          radius: 50,
        ),
        SizedBox(height: 10),
        Text("Creador 2"), // Nombre del creador 2
      ],
    ),
  );
}

class QuestionAnswer {
  final String question;
  final String answer;

  QuestionAnswer({required this.question, required this.answer});
}
