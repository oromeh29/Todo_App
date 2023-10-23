import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_application/Models/task_model.dart';
import 'package:todo_application/Screens/Tasks/task_item.dart';
import 'package:todo_application/Shared/Styles/Colors.dart';
import 'package:todo_application/Shared/firebase/firebase_functions.dart';

class TasksTab extends StatefulWidget {
  static const String routeName="Taskstap";

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime selectedDate=DateTime.now();
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        CalendarTimeline(
          initialDate: selectedDate,
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateSelected: (date) {
            setState(() {
              selectedDate=date;
            });
          },
          leftMargin: 20,
          monthColor: PrimaryColor,
          dayColor: PrimaryColor.withOpacity(0.70),
          activeDayColor: Colors.white,
          activeBackgroundDayColor: PrimaryColor,
          dotsColor: Colors.white,
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
      StreamBuilder(
          stream: FireBaseFunctions.getTasks(selectedDate),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("SomeThing Has Error",
                    style: TextStyle(fontSize: 20, color: Colors.black)),
              );
            }
            List<TaskModel>tasks=
                snapshot.data?.docs.map((e) => e.data()).toList()??[];
            return Expanded(
                child:
                ListView.builder(itemBuilder: (context, index) {
                  return TaskItem(task: tasks[index],);
                },
                itemCount: tasks.length,
                )

            );
          },
        )
      ],
    );
  }
}
