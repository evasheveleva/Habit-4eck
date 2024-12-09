import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_project/main.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  _WelcomeScreenState createState() => _WelcomeScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 109, 231, 109),
        title: const Text('Hab1t 4eak', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,),
      ),
      backgroundColor: const Color.fromARGB(255, 247, 245, 245),
      body: const Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.pushReplacementNamed(context, '/registration');
        },
        label: const Text("Регистрация", style: TextStyle(color: Colors.black,),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime today = DateTime.now();
  DateTime? _selectedDay;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 109, 231, 109),
        title: const Text('Календарь', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,),
      ),
      body:TableCalendar(
        firstDay: DateTime(today.year, today.month - 3, today.day),
        lastDay: DateTime(today.year, today.month + 3, today.day),
        focusedDay: today,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              today = focusedDay;
            });
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          today = focusedDay;
        },
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 109, 231, 109),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
              TextButton(
                onPressed: () {
                Navigator.pushReplacementNamed(context, '/main');
                },
                child: const Column( 
                  children: <Widget>[
                    Icon(Icons.calendar_today, color: Colors.black,),
                    Text("Календарь",style: TextStyle(color: Colors.black,))
                  ]
                ),
              ),
              TextButton(
                onPressed: () {
                Navigator.pushReplacementNamed(context, '/personal');
                },
                child: const Column( 
                  children: <Widget>[
                    Icon(Icons.toc, color: Colors.black,),
                    Text("ЛК",style: TextStyle(color: Colors.black,)),
                  ]
                ),
              ),
              TextButton(
                onPressed: () {
                Navigator.pushReplacementNamed(context, '/statistic');
                },
                child: const Column( 
                  children: <Widget>[
                    Icon(Icons.show_chart, color: Colors.black,),
                    Text("СТАТ",style: TextStyle(color: Colors.black,)),
                  ]
                ),
              ),
            ]  
            )
          ), 
    );
  }

  Widget tableContent() {
  DateTime today = DateTime.now();

  return Column(
    children: [
      const Text("Самое время для новых привычек!"),
      TableCalendar(
        calendarStyle: const CalendarStyle(

              // Use `CalendarStyle` to customize the UI
            outsideDaysVisible: false,
          ),
        rowHeight: 50,
        headerStyle: 
          const HeaderStyle(formatButtonVisible: false, titleCentered: true),
        focusedDay: today,
        firstDay: DateTime.utc(2024, 10, 1), 
        lastDay: DateTime.utc(2025, 10, 1)),
    ],
  );
}
}