import 'package:flutter/material.dart';

import 'controller/todo_controller.dart';

//App Colors
const blue = Color(0xff4DCFE1);
const background = Color(0xff303030);
const appBar = Color(0xff424242);
const hint = Color(0xff787878);
const white = Color(0xffFFFFFF);

//App Texts
class MyText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const MyText(this.text, this.color, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: FontWeight.w500,
          fontFamily: "Inter-Regular.ttf"),
    );
  }
}

class BottomNavigationClass extends StatelessWidget {
  const BottomNavigationClass({
    Key? key,
    required this.todoController,
  }) : super(key: key);

  final TodoController todoController;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: white,
      backgroundColor: background,
      onTap: todoController.changeTabIndex,
      currentIndex: todoController.currentIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.toc_rounded,
              size: 30,
            ),
            label: "Todos"),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.stacked_line_chart_rounded,
            size: 30,
            color: white,
          ),
          label: "Stats",
        ),
      ],
    );
  }
}
