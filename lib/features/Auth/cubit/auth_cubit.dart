import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/Auth/cubit/user_state.dart';
import 'package:todoapp/features/Auth/data/interface/i_auth_service.dart';
import 'package:todoapp/features/Auth/data/service/auth_service.dart';

class AuthCubit extends Cubit<UserState> {
  final IAuthService service = AuthService();

  AuthCubit() : super(UserUnAuthorized());

  Future<void> login(String email, String password) async {
    try {
      emit(UserLoading());
      final user = await service.login(email, password);
      emit(UserAuthorized(user: user));
    } catch (e) {
      emit(UserError(errorMessage: e.toString()));
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      emit(UserLoading());
      final user = await service.loginWithGoogle();
      emit(UserAuthorized(user: user));
    } catch (e) {
      emit(UserError(errorMessage: e.toString()));
    }
  }


  Future<void> register(String email, String password) async {
    try {
      emit(UserLoading());
      final user = await service.register(email, password);
      emit(UserAuthorized(user: user));
    } catch (e) {
      emit(UserError(errorMessage: e.toString()));
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      emit(UserLoading());
      await service.forgotPassword(email);
      emit(UserForgotPassword());
    } catch (e) {
      emit(UserError(errorMessage: e.toString()));
    }
  }

  Future<void> signOut() async {
    try {
      emit(UserLoading());
      await service.signOut();
      emit(UserUnAuthorized());
    } catch (e) {
      emit(UserError(errorMessage: e.toString()));
    }
  }

}
