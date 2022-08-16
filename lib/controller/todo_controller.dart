import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class Todo {
  String id;
  String description;
  bool isCompleted;

  Todo({required this.description})
      : id = const Uuid().v1(),
        isCompleted = false;
}

class TodoController extends GetxController {
  late List<Todo> _todos;

  List<Todo> get todos => _todos;

  TodoController() {
    _todos = [];
  }

  addTodo(Todo todo) {
    _todos.add(todo);
    update();
  }

  deleteTodo(String id) {
    _todos.removeWhere((element) => element.id == id);
    update();
  }

  changeStatus(Todo todo) {
    int index = _todos.indexOf(todo);
    _todos[index].isCompleted = !_todos[index].isCompleted;
    update();
  }

  updateTodo(Todo oldTodo, String newDescription) {
    int index = _todos.indexOf(oldTodo);
    _todos[index].description = newDescription;
    update();
  }

  var checkBoolean = true.obs;
  var currentIndex = 0;

  void changeTabIndex(int index) {
    currentIndex = index;
  }
}
