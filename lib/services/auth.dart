import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import 'package:firebase_user_stream/firebase_user_stream.dart';
import 'package:nakshatra_hospital_management/authenticate/authenticate.dart';

// SharedPreferences pref;

class AuthService {
  final FirebaseAuth auth;

  AuthService({this.auth});

  Stream<User> get authStateChanges => auth.authStateChanges();

  Future<String> signIn({String email, String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
