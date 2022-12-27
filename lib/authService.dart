import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  final FirebaseAuth _fAuth = FirebaseAuth.instance;
  User? get currentuser => _fAuth.currentUser;

  Stream<User?> get authStateChanges => _fAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  })async{
    await _fAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  })async{
    await _fAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async{
    await _fAuth.signOut();
  }

}