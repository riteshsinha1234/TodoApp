import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/constants.dart';
import 'package:to_do/screens/add_todo.dart';

import '../controller/todo_controller.dart';

class HomePage extends StatelessWidget {
  final todoController = Get.put(TodoController());

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: appBar,
        title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: const MyText("Vanilla Example", white, 22)),
        actions: const [
          Icon(Icons.filter_list_rounded, size: 27, color: white),
          SizedBox(width: 25),
          Icon(Icons.more_horiz, size: 27, color: white),
          SizedBox(width: 15)
        ],
      ),
      bottomNavigationBar:
          BottomNavigationClass(todoController: todoController),
      body: GetBuilder(
        builder: (TodoController todoController) {
          return ListView.builder(
            itemCount: todoController.todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  //TODO:to update todo
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return AddTodo(
                        type: "update",
                        todo: todoController.todos[index],
                      );
                    },
                  );
                },
                leading: Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: white,
                  ),
                  child: Checkbox(
                    value: todoController.todos[index].isCompleted,
                    onChanged: (value) {
                      todoController.changeStatus(todoController.todos[index]);
                    },
                  ),
                ),
                title: Text(
                  todoController.todos[index].description,
                  style: const TextStyle(color: white, fontSize: 17),
                ),
                trailing: IconButton(
                  onPressed: () {
                    todoController.deleteTodo(todoController.todos[index].id);
                  },
                  icon: const Icon(Icons.delete, color: white),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddTodo(type: "new", todo: Todo(description: "")));
        },
        backgroundColor: blue,
        child: const Icon(Icons.add, color: background),
      ),
    );
  }
}
