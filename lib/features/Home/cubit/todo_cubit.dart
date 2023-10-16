import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoapp/features/Home/data/interface/i_todo_service.dart';
import 'package:todoapp/features/Home/data/service/todo_service.dart';
import 'package:todoapp/features/Home/model/todo_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  ITodoService service = TodoService();

  TodoCubit() : super(TodoInitial());

  Future<void> addTodo(TodoModel todo) async {
    try {
      emit(TodoLoading());
      await service.addTodo(todo);
      emit(TodoSuccess());
    } catch (e) {
      emit(TodoError(errorMessage: e.toString()));
    }
  }

  Future<void> editTodo(TodoModel todo) async {
    try {
      emit(TodoLoading());
      await service.editTodo(todo);
      emit(TodoSuccess());
    } catch (e) {
      emit(TodoError(errorMessage: e.toString()));
    }
  }

  Future<void> delete(String id) async {
    try {
      emit(TodoLoading());
      await service.deleteTodo(id);
      emit(TodoSuccess());
    } catch (e) {
      emit(TodoError(errorMessage: e.toString()));
    }
  }

  Stream<List<TodoModel>> getTodos() {
    return service.getTodo();
  }

}
