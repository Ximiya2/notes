class TodoListModel {
  String title;
  String note;
  String currentTime;

  TodoListModel({required this.title, required this.note, required this.currentTime});

  TodoListModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        note = json['note'],
        currentTime = json['currentTime'];

  Map<String, dynamic> toJson() => {
    'title': title,
    'note': note,
    'currentTime': currentTime,
  };
}