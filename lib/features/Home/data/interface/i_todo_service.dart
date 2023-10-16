import 'package:todoapp/features/Home/model/todo_model.dart';

abstract class ITodoService {
  ITodoService();

  Future<void> addTodo(TodoModel item);

  Future<void> editTodo(TodoModel item);

  Future<void> deleteTodo(String id);

  Stream<List<TodoModel>> getTodo();
}
