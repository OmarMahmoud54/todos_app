import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  DateTime createdAt;

  @HiveField(3)
  bool isCompleted;

  @HiveField(4)
  int color;

  Todo({
    required this.title,
    required this.description,
    required this.createdAt,
    required this.isCompleted,
    required this.color,
  });

  // Helper method to toggle completion status
  void toggleCompletion() {
    isCompleted = !isCompleted;
    save(); // Save changes to Hive
  }

  // Helper method to update todo
  void updateTodo({String? newTitle, String? newDescription, int? newColor}) {
    if (newTitle != null) title = newTitle;
    if (newDescription != null) description = newDescription;
    if (newColor != null) color = newColor;
    save(); // Save changes to Hive
  }

  @override
  String toString() {
    return 'Todo{title: $title, description: $description, createdAt: $createdAt, isCompleted: $isCompleted, color: $color}';
  }
}
