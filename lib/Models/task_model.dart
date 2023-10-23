class TaskModel {
  String id;
  String title;
  String Description;
  int date;
  bool isDone;

  TaskModel(
      {this.id = " ",
      required this.title,
      required this.Description,
      required this.date,
      this.isDone = false});


  TaskModel.fromjson(Map<String, dynamic> json)
      : this(
            title: json['title'],
            Description: json['description'],
            date: json['date'],
            isDone: json['isDone'],
            id: json['id']
  );

  Map<String ,dynamic>tojson(){
    return{
    "title": title,
    "description": Description,
    "date":date,
    "isDone": isDone,
    "id": id
    };

  }
/*TaskModel fromjson(Map<String ,dynamic>json){
    return TaskModel(title: json['title'],
        Description:json['description'],
      date: json['date'],
      id: json['id'],
      isDone: json['isDone']

    );
  }*/
}
