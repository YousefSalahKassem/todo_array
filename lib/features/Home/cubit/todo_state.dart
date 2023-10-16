part of 'todo_cubit.dart';

abstract class TodoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoSuccess extends TodoState {}

class TodoError extends TodoState {
  final String errorMessage;

  TodoError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
