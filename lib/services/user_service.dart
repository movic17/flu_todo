import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flu_todo/models/user.dart';

class UserService {
  final _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel myUser, String uid) async {
    try {
      await _firestore.collection('users').doc(uid).set(myUser.toDoc());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<UserModel> getMyUser(var uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      return UserModel.fromDocSnap(doc);
    } catch(e) {
      rethrow;
    }


  }
}
