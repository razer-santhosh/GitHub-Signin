import 'package:firebase_auth/firebase_auth.dart';

class LoginController {
  late final FirebaseAuth _firebaseAuth;
 LoginController(this._firebaseAuth);
 Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
 Future<String?> signIn({required String token}) async {
 try {
 // Use the GitHub token to sign in with Firebase
 await _firebaseAuth.signInWithCustomToken(token);
 return "Signed in";
 } on FirebaseAuthException catch (e) {
 return e.message;
 }
 }
 Future<void> signOut() async {
 await _firebaseAuth.signOut();
 }
}