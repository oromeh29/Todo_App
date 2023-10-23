import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_application/Layout/home_layout.dart';
import 'package:todo_application/Models/task_model.dart';
import 'package:todo_application/Shared/firebase/firebase_functions.dart';

class editTaskScreen extends StatelessWidget {

late TaskModel edittask;
static const String routeName="editscreen";
  var editTitle=TextEditingController();
  var ediDescription=TextEditingController();

  @override
  Widget build(BuildContext context) {

    var args=ModalRoute.of(context)!.settings.arguments as TaskModel;
    editTitle.text=args.title;
    ediDescription.text=args.Description;
    return Scaffold(
      backgroundColor: const Color(0xffDFECDB),
      appBar: AppBar(
        title: const Text("ToDo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Edit Your Task",
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.nuosuSil(color: Colors.black, fontSize: 20),
                ),
                const SizedBox( height: 20,),
                TextFormField(

                  validator: (value) {
                    if(value==null || value.isEmpty){
                      return "Please Edit The Task ";
                    }return null;
                  },
                  controller: editTitle,
                  decoration: InputDecoration(
                      label: const Text("Edit this Title"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.blueAccent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.blueAccent))),
                ),
                const SizedBox(height: 15,),
                TextFormField(
                  validator: (value) {
                    if(value==null || value.isEmpty){
                      return "Please Edit Task Details ";
                    }return null;
                  },
                  controller: ediDescription,
                  decoration: InputDecoration(
                      label: const Text("Edit This Description"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.blueAccent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.blueAccent))),
                ),
                const SizedBox(height: 20,),Text("Selected Date",style: GoogleFonts.nuosuSil(
                  color: Colors.black, fontSize: 20
                )
                ),
                const SizedBox(height: 20,),
                Text("17/10/2023",style: GoogleFonts.nuosuSil(
                    color: Colors.black, fontSize: 20
                ),textAlign: TextAlign.center,),
               const SizedBox(height: 50,),
                ElevatedButton(
                  style: ButtonStyle(
                     shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(12),side: const BorderSide(
                       color: Colors.transparent
                     )
                     ))
                  ),

                    onPressed: () {
                    args.title=editTitle.text;
                    args.Description=ediDescription.text;
                      FireBaseFunctions.updateTask(edittask);

Navigator.pushNamed(context, HomeLayout.routeName);




                },

                    child: Text("Save Changes",style: GoogleFonts.nuosuSil(
                  fontSize: 20,color: Colors.white
                ),

                ))

              ],
            ),
          ),
        ),
      ),
    );
  }
}
