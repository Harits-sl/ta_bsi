import 'package:firebase_auth/firebase_auth.dart';
import 'package:ta_bsi/src/data/models/user_model.dart';

class AuthUserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // get user => _auth.currentUser;

  //SIGN UP METHOD
  Future signUp({required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      // final User user = result.user!;

      UserModel user = UserModel(
        id: userCredential.user!.uid,
        email: email,
        name: 'dsadsd',
      );

      return user;
    } on FirebaseAuthException catch (e) {
      print('error firebase ${e.message}');
      return e.message;
    }
  }

  //SIGN IN METHOD
  Future signIn({required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      UserModel _user = UserModel(
        id: userCredential.user!.uid,
        email: email,
        name: 'dsadsd',
      );

      return _user;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN OUT METHOD
  Future signOut() async {
    await _auth.signOut();

    print('signout');
  }
}
