import 'package:firebase_database/firebase_database.dart';
import 'package:ta_bsi/src/data/models/user_model.dart';

class UserService {
  final DatabaseReference ref = FirebaseDatabase.instance.ref();

  Future<void> setUserToFirebase(UserModel user) async {
    // DatabaseReference ref = FirebaseDatabase.instance.ref("users/${user.id}");

    await ref.child('users/${user.id}').set({
      'name': user.name,
      'email': user.email,
    });
  }

  Future<UserModel> getUserById(String id) async {
    final snapshot = await ref.child('users/$id').get();
    final value = (snapshot.value as Map);
    return UserModel(
      id: id,
      email: value['email'],
      name: value['name'],
    );
  }
}
