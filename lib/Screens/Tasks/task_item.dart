import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_application/Models/task_model.dart';
import 'package:todo_application/Screens/Tasks/Edit_task.dart';
import 'package:todo_application/Shared/Styles/Colors.dart';
import 'package:todo_application/Shared/firebase/firebase_functions.dart';

class TaskItem extends StatelessWidget {
  TaskModel task;

  TaskItem({required this.task, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child:
        Slidable(
          startActionPane: ActionPane(motion: const DrawerMotion(), children: [
            SlidableAction(
              onPressed: (context) {
                FireBaseFunctions.deleteTask(task.id);
              },
              label: "Delete",
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14), topRight: Radius.circular(14)),
            ),
            SlidableAction(
              onPressed: (context,) {
               Navigator.pushNamed(context, editTaskScreen.routeName,
              arguments: task
                );
              },
              label: "Edit",
              icon: Icons.delete,
              backgroundColor: Colors.blue,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14), topRight: Radius.circular(14)),
            ),
          ]),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  width: 3,
                  decoration: BoxDecoration(
                      color: PrimaryColor,
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(task.title),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(task.Description),
                ],
              ),
              const Spacer(),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blueAccent,
                  ),
                  child: const Icon(
                    Icons.done,
                    size: 25,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
