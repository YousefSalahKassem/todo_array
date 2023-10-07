import 'package:todoapp/features/Auth/model/user_model.dart';

abstract class IAuthService {
  const IAuthService();

  Future<UserModel> login(String email, String password);

  Future<UserModel> register(String email, String password);

  Future<UserModel> loginWithGoogle();

  Future<bool> signOut();

  Future<bool> forgotPassword(String email);
}
