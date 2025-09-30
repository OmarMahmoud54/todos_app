import 'package:hive_flutter/hive_flutter.dart';
import '../models/todo.dart';

class TodoService {
  static const String _boxName = 'todos';

  // Get the Hive box
  static Box<Todo> get _box => Hive.box<Todo>(_boxName);

  // Initialize the box
  static Future<void> init() async {
    await Hive.openBox<Todo>(_boxName);
  }

  // Create a new todo
  static Future<void> addTodo({
    required String title,
    required String description,
    required int color,
  }) async {
    final todo = Todo(
      title: title,
      description: description,
      createdAt: DateTime.now(),
      isCompleted: false,
      color: color,
    );

    await _box.add(todo);
  }

  // Get all todos
  static List<Todo> getAllTodos() {
    return _box.values.toList();
  }

  // Get todos sorted by creation date (newest first)
  static List<Todo> getTodosSorted() {
    final todos = _box.values.toList();
    todos.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return todos;
  }

  // Delete a todo by key
  static Future<void> deleteTodo(int key) async {
    await _box.delete(key);
  }

  // Delete a todo by object
  static Future<void> deleteTodoByObject(Todo todo) async {
    await todo.delete();
  }

  // Toggle completion status
  static Future<void> toggleTodoCompletion(Todo todo) async {
    todo.toggleCompletion();
  }

  // Update a todo
  static Future<void> updateTodo(
    Todo todo, {
    String? newTitle,
    String? newDescription,
    int? newColor,
  }) async {
    todo.updateTodo(
      newTitle: newTitle,
      newDescription: newDescription,
      newColor: newColor,
    );
  }

  // Get completed todos
  static List<Todo> getCompletedTodos() {
    return _box.values.where((todo) => todo.isCompleted).toList();
  }

  // Get pending todos
  static List<Todo> getPendingTodos() {
    return _box.values.where((todo) => !todo.isCompleted).toList();
  }

  // Clear all todos
  static Future<void> clearAllTodos() async {
    await _box.clear();
  }

  // Get todo count
  static int getTodoCount() {
    return _box.length;
  }

  // Get completed todo count
  static int getCompletedCount() {
    return _box.values.where((todo) => todo.isCompleted).length;
  }

  // Get pending todo count
  static int getPendingCount() {
    return _box.values.where((todo) => !todo.isCompleted).length;
  }
}
