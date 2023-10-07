import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todoapp/features/Auth/data/interface/i_auth_service.dart';
import 'package:todoapp/features/Auth/model/user_model.dart';

class AuthService extends IAuthService {
  final auth = FirebaseAuth.instance;

  @override
  Future<bool> forgotPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
    return true;
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final response =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    final user = UserModel(
      email: response.user?.email,
      name: response.user?.displayName,
      image: response.user?.photoURL,
    );
    return user;
  }

  @override
  Future<UserModel> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await auth.signInWithCredential(credential);

    return UserModel(
      email: googleUser.email,
      image: googleUser.photoUrl,
      name: googleUser.displayName,
    );
  }

  @override
  Future<UserModel> register(String email, String password) async {
    final response = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final user = UserModel(
      email: response.user?.email,
      name: response.user?.displayName,
      image: response.user?.photoURL,
    );
    return user;
  }

  @override
  Future<bool> signOut() async {
    if(await GoogleSignIn().isSignedIn()){
      await GoogleSignIn().signOut();
    }
    await auth.signOut();
    return true;
  }
}
