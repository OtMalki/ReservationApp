import 'package:firebase_auth/firebase_auth.dart'; 
import 'package:reservation/Models/Userr.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Userr? _userFromFirebaseUser(User? user){
    return user != null ? Userr(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<Userr?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // sigh in anonymous
  Future sighInAnon() async {
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}