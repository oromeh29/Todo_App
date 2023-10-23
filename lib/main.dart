

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:todo_application/Screens/Tasks/Edit_task.dart';
import 'package:todo_application/Screens/Tasks/tasks_tab.dart';
import 'package:todo_application/Shared/Styles/my_Theme_Data.dart';
import 'package:todo_application/firebase_options.dart';

import 'Layout/home_layout.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.light,
        initialRoute: "Home",
        routes: {
          HomeLayout.routeName:(context)=>HomeLayout(),
          TasksTab.routeName:(context)=>TasksTab(),
          editTaskScreen.routeName:(context)=>editTaskScreen(),

        }
    );
  }


  }

