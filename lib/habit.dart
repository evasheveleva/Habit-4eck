class Habit {
  final int? id;
  final String name;
  int completed; // число завершений

  Habit({this.id, required this.name, this.completed = 0});
}