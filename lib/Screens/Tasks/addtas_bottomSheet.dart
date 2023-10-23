import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_application/Models/task_model.dart';
import 'package:todo_application/Shared/firebase/firebase_functions.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var titlecontroller = TextEditingController();
  var descriptioncontroller = TextEditingController();
  var formkey=GlobalKey<FormState>();
  var SelectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Form(
        key: formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add New Task",
              textAlign: TextAlign.center,
              style: GoogleFonts.nunitoSans(
                  fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                if(value==null || value.isEmpty){
                  return "Please Enter The Task Title";
                }return null;
              },
              controller: titlecontroller,
              decoration: InputDecoration(
                  label: Text("Task Title"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blueAccent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blueAccent))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) {
                if(value==null || value.isEmpty){
                  return "Please Enter The Task Description";
                }return null;
              },
              controller: descriptioncontroller,
              decoration: InputDecoration(
                  label: Text("Task Description"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blueAccent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blueAccent))),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Selected Date",
              style: GoogleFonts.nunitoSans(
                  fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                SelectDate(context);
              },
              child: Text(
                SelectedDate.toString().substring(0, 10),
                textAlign: TextAlign.center,
                style: GoogleFonts.nunitoSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.blueAccent),
              ),
            ),
            ElevatedButton(
                onPressed: () {
               if(formkey.currentState!.validate()){
                 print( DateUtils.dateOnly(SelectedDate).microsecondsSinceEpoch.toString());

                 TaskModel taskmodel = TaskModel(
                     title: titlecontroller.text,
                     Description: descriptioncontroller.text,
                     date: DateUtils.dateOnly(SelectedDate).microsecondsSinceEpoch);
                 FireBaseFunctions.addTask(taskmodel).then((value) {
                   Navigator.pop(context);
                 } );
               }
                },
                child: Text("Add Task"))
          ],
        ),
      ),
    );
  }

  SelectDate(BuildContext context) async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: SelectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(
          Duration(days: 365),

          /*   if(chosenDate==null){
     return ;
     }
            SelectedDate=chosenDate;*/
        ));
  }
}
