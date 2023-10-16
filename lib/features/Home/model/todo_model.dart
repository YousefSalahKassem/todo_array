class TodoModel {
  final String title;
  final String description;
  final String id;

  TodoModel({required this.title, required this.description, required this.id});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'id': id,
    };
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        title: json['title'], description: json['description'], id: json['id']);
  }
}
