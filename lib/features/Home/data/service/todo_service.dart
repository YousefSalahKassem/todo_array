import 'package:todoapp/features/Home/data/interface/i_todo_service.dart';
import 'package:todoapp/features/Home/model/todo_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoService extends ITodoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TodoService();

  @override
  Future<void> addTodo(TodoModel item) async {
    await _firestore.collection('todo').doc(item.id).set(item.toJson());
  }

  @override
  Future<void> deleteTodo(String id) async {
    await _firestore.collection('todo').doc(id).delete();
  }

  @override
  Future<void> editTodo(TodoModel item) async {
    await _firestore.collection('todo').doc(item.id).update(item.toJson());
  }

  @override
  Stream<List<TodoModel>> getTodo() {
    return _firestore.collection('todo').snapshots().map((snapshots) =>
        snapshots.docs.map((doc) => TodoModel.fromJson(doc.data())).toList());
  }
}
