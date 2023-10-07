import 'package:equatable/equatable.dart';
import 'package:todoapp/features/Auth/model/user_model.dart';

abstract class UserState extends Equatable{
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserUnAuthorized extends UserState {}

class UserLoading extends UserState {}

class UserAuthorized extends UserState {
  final UserModel user;

  const UserAuthorized({required this.user});

  @override
  List<Object?> get props => [user];
}

class UserForgotPassword extends UserState {}

class UserError extends UserState {
  final String errorMessage;

  const UserError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}