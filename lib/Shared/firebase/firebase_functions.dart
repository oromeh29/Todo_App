import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_application/Models/task_model.dart';

class FireBaseFunctions {
  static CollectionReference<TaskModel> getTasksCollections() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromjson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.tojson();
      },
    );
  }

  static Future<void> addTask(TaskModel taskModel) async {
    var Collection = getTasksCollections();
    var docRef = Collection.doc();
    taskModel.id = docRef.id;
    docRef.set(taskModel);
  }
  static void updateTask(TaskModel task){
    getTasksCollections().doc(task.id).update(task.tojson());
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime dateTime) {
    return getTasksCollections()
        .where("date", isEqualTo: dateTime.microsecondsSinceEpoch)
        .snapshots();
  }
  static deleteTask(String id){
    getTasksCollections().doc(id).delete();
  }
}
