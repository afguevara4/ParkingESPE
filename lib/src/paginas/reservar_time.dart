import 'package:flutter/material.dart';
import 'package:parking_espe/src/paginas/Welcome.dart';
import 'package:table_calendar/table_calendar.dart';

import 'drawer.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  void _showReservationNotificationAndNavigate() {
    final snackBar = SnackBar(
      content: Text('¡Fecha reservada con éxito!'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // Navegar a otra pantalla después de la notificación
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Welcome()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 115, 220, 89),
        centerTitle: true,
        title: Text("¿Dónde quieres aparcar...?",
            style: TextStyle(color: Colors.black)),
      ),
      drawer: Drawer(
        child: CustomDrawer(),
      ),
      body: Column(
        children: [
          Expanded(
            child: TableCalendar(
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2023, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onPageChanged: (focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                });
              },
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                _showReservationNotificationAndNavigate();
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 115, 220, 89),
              ),
              child: Text('Reservar Fechas'),
            ),
          ),
        ],
      ),
    );
  }
}
