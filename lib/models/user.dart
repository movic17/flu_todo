import 'package:cloud_firestore/cloud_firestore.dart';
import 'task.dart';

class UserModel {
  final String? uid;
  final String? displayName;
  final String? email;
  final String? password;

  UserModel({this.uid, this.displayName, this.email, this.password});

  factory UserModel.fromDocSnap(DocumentSnapshot docSnap) {
    return UserModel(
      uid: docSnap.id,
      displayName: docSnap.get('display_name'),
      email: docSnap.get('email'),
    );
  }

  Map<String, dynamic> toDoc() {
    return {
      'display_name': displayName,
      'email': email,
      'password': password,
    };
  }
}
