import 'package:flutter/material.dart';
import 'package:todo_application/Screens/Settings/settings_tab.dart';
import 'package:todo_application/Screens/Tasks/addtas_bottomSheet.dart';
import 'package:todo_application/Screens/Tasks/tasks_tab.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "Home";
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;
  List<Widget>tabs=[TasksTab(),SettingTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo"),
        toolbarHeight: 50,
      ),
      body:tabs[index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ShowSheet();
        },
        child: Icon(Icons.add),
        shape: CircleBorder(side: BorderSide(color: Colors.white, width: 3)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        color: Colors.white,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
          ],
          onTap: (value) {
            index = value;
            setState(() {});
          },
          currentIndex: index,
        ),
      ),
    );
  }
  void ShowSheet(){

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
        builder: (context) {
          return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom
              ),
            child: AddTaskBottomSheet(),
          );
        },
    );
  }
}
