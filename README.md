# Todo App with Hive Local Storage

A Flutter Todo application that uses Hive for local storage. This app demonstrates CRUD operations with a beautiful Material 3 design.

## Features

- ✅ Create new todos with title, description, and custom colors
- ✅ View all todos with their completion status
- ✅ Toggle todo completion status
- ✅ Edit existing todos
- ✅ Delete individual todos
- ✅ Clear all todos
- ✅ Statistics showing total, pending, and completed todos
- ✅ Beautiful Material 3 UI with color-coded todos
- ✅ Local storage using Hive (no internet required)

## Todo Model

Each Todo contains:

- **Title** (String) - Required
- **Description** (String) - Optional
- **CreatedAt** (DateTime) - Auto-generated
- **isCompleted** (bool) - Default false
- **color** (int) - User-selectable color

## Architecture

- **Models**: Todo model with Hive annotations
- **Services**: TodoService for all CRUD operations
- **Screens**: TodoListScreen as the main UI
- **Widgets**: Reusable TodoItem and AddTodoDialog widgets
- **Utils**: ColorUtils for color management

## Getting Started

1. Install dependencies:

   ```bash
   flutter pub get
   ```

2. Generate Hive adapters:

   ```bash
   flutter packages pub run build_runner build
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Dependencies

- `hive: ^2.2.3` - NoSQL database
- `hive_flutter: ^1.1.0` - Hive Flutter integration
- `path_provider: ^2.1.2` - Path utilities

### Dev Dependencies

- `hive_generator: ^2.0.1` - Code generation
- `build_runner: ^2.4.7` - Build system

## Implementation Details

### Hive Setup

- Hive is initialized in `main.dart`
- Todo adapter is registered automatically
- Box is opened for persistent storage

### CRUD Operations

All operations are handled by `TodoService`:

- `addTodo()` - Create new todo
- `getAllTodos()` - Read all todos
- `updateTodo()` - Update existing todo
- `deleteTodo()` - Delete todo
- `toggleTodoCompletion()` - Toggle completion status

### UI Features

- Real-time updates using `ValueListenableBuilder`
- Material 3 design system
- Color-coded todos
- Statistics dashboard
- Responsive design

## File Structure

```
lib/
├── main.dart                 # App entry point
├── models/
│   ├── todo.dart            # Todo model with Hive annotations
│   └── todo.g.dart          # Generated Hive adapter
├── services/
│   └── todo_service.dart    # CRUD operations
├── screens/
│   └── todo_list_screen.dart # Main UI screen
├── widgets/
│   ├── todo_item.dart       # Individual todo widget
│   └── add_todo_dialog.dart # Add/Edit todo dialog
└── utils/
    └── color_utils.dart     # Color management utilities
```
