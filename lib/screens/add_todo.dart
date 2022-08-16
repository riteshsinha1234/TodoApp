import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/constants.dart';

import '../controller/todo_controller.dart';

class AddTodo extends StatefulWidget {
  final String type;
  final Todo todo;

  const AddTodo({Key? key, required this.type, required this.todo})
      : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final _formKey = GlobalKey<FormState>();
  late String description;

  @override
  Widget build(BuildContext context) {
    final todoController = Get.find<TodoController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: appBar,
        leading: const Icon(Icons.arrow_back_ios, color: white),
        centerTitle: true,
        title: widget.todo != null
            ? const MyText("Add Todo", white, 25)
            : const MyText("Update", white, 20),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                style: const TextStyle(color: white, fontSize: 22),
                initialValue:
                    widget.todo != null ? widget.todo.description : '',
                onSaved: (value) => description = value!,
                decoration: const InputDecoration(
                  hintText: "What need to be done?",
                  hintStyle: TextStyle(color: hint, fontSize: 25),
                ),
              ),
              const SizedBox(height: 30),
              // ignore: deprecated_member_use
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Flexible(
                  flex: 1,
                  child: FloatingActionButton(
                    onPressed: () {
                      _formKey.currentState?.save();
                      if (widget.type == "new") {
                        todoController.addTodo(Todo(description: description));
                      } else {
                        todoController.updateTodo(widget.todo, description);
                      }
                      Navigator.of(context).pop();
                    },
                    backgroundColor: blue,
                    child: const Icon(Icons.add, color: background),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
