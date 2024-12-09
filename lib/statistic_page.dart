import 'package:flutter/material.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Статистика'),
        backgroundColor: const Color.fromARGB(255, 109, 231, 109),
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
}