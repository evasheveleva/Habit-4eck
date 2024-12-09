import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'habit.dart';

class HabitTracker extends StatefulWidget {
  const HabitTracker({super.key});

  @override
  State<HabitTracker>  createState() => _PersonalPage();
}

class _PersonalPage extends State<HabitTracker> {
  final _dbHelper = DatabaseHelper();
  final _habitController = TextEditingController();
  List<Habit> _habits = [];

  @override
  void initState() {
    super.initState();
    _loadHabits();
  }

  void _loadHabits() async {
    final habitsData = await _dbHelper.getHabits();
    setState(() {
      _habits = habitsData.map((habit) => Habit(
        id: habit['id'],
        name: habit['name'],
        completed: habit['completed'],
      )).toList();
    });
  }

  void _addHabit() {
    if (_habitController.text.isNotEmpty) {
      _dbHelper.insertHabit(_habitController.text);
      _loadHabits();
      _habitController.clear();
    }
  }

  void _deleteHabit(int id) async {
    await _dbHelper.deleteHabit(id);
    _loadHabits();
  }
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Личный кабинет'),
          backgroundColor: const Color.fromARGB(255, 109, 231, 109),
        ), 
        body: Column(
          children: [
            TextField(
              controller: _habitController,
              decoration: const InputDecoration(hintText: 'Введите привычку'),
            ),
            ElevatedButton(onPressed: _addHabit, child: const Text('Добавить')),
            Expanded(
              child: ListView.builder(
                itemCount: _habits.length,
                itemBuilder: (context, index) {
                  final habit = _habits[index];
                  return Dismissible(
                    key: Key(habit.id.toString()),
                    onDismissed: (direction) {
                      _deleteHabit(habit.id!);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('Привычка удалена')));
                    },
                    background: Container(color: Colors.red),
                    child: ListTile(
                      title: Text(habit.name),
                      trailing: IconButton(
                        icon: const Icon(Icons.check),
                        onPressed: () {
                          setState(() {
                            habit.completed++;
                            // обновите чтение, если нужно
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          
          ],
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
      )
    );
  }
}