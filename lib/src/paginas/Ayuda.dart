import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
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
      question: '¿Cómo editar la información de mi cuenta?',
      answer: 'Puedes editar tu información yendo a la sección de perfil...',
    ),
    QuestionAnswer(
      question: '¿Cómo restablecer mi contraseña?',
      answer:
          'Para restablecer tu contraseña, ve a la página de inicio de sesión...',
    ),
    QuestionAnswer(
      question: '¿Cómo restablecer mi contraseña?',
      answer:
          'Para restablecer tu contraseña, ve a la página de inicio de sesión...',
    ),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color.fromARGB(255, 115, 220, 89),
            floating: true,
            pinned: true,
            expandedHeight: 200, // Set the desired expanded height
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Color.fromARGB(255, 138, 126, 130),
              ),
              centerTitle: true,
              title: Text('A Y U D A'),
            ),
          ),
          SliverFillRemaining(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                _buildFAQPage(),
                _buildContactsPage(),
                _buildCreatorsPage(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 115, 220, 89),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: GNav(
            backgroundColor: Color.fromARGB(255, 115, 220, 89),
            color: Colors.black,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.white,
            haptic: true,
            tabActiveBorder: Border.all(color: Colors.black, width: 1),
            gap: 8,
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.question_answer,
                text: 'Preguntas',
              ),
              GButton(
                icon: Icons.contacts,
                text: 'Contactos',
              ),
              GButton(
                icon: Icons.people,
                text: 'CEOs',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
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
          subtitle: const Column(
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
        Divider(),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text("Contáctanos por teléfono"),
          subtitle: const Column(
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
        Divider(),
        ListTile(
          leading: Icon(FontAwesomeIcons.whatsapp),
          title: Text("WhatsApp"),
          subtitle: const Column(
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
        Divider(),
        ListTile(
          leading: Icon(Icons.social_distance),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Redes Sociales"),
              Text("Puedes saber más de nosotros en las redes"),
            ],
          ),
          subtitle: const Row(
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
        Divider(),
      ],
    );
  }
}

Widget _buildCreatorsPage() {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(
              "assets/page-1/images/Dennis.jpg"), // Ruta de la imagen del creador 1
          radius: 100,
        ),
        SizedBox(height: 20),
        Text("Dennis Caisa"), // Nombre del creador 1
        SizedBox(height: 30),
        CircleAvatar(
          backgroundImage: AssetImage(
              "assets/page-1/images/Adrian.jpg"), // Ruta de la imagen del creador 2
          radius: 100,
        ),
        SizedBox(height: 20),
        Text("Adrian Guevara"), // Nombre del creador 2
      ],
    ),
  );
}

class QuestionAnswer {
  final String question;
  final String answer;

  QuestionAnswer({required this.question, required this.answer});
}
