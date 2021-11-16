import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ForgotPwdController extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  final _password = ''.obs;
  final _isLoading = false.obs;

  String get password => _password.value;
  bool get isLoading => _isLoading.value;

  Future<void> displayPassword(String email) async {
    _isLoading.value = true;
    try {
      final snapshot = await _firestore.collection('users').get();
      for (var doc in snapshot.docs) {
        if (email == doc.get('email')) {
          _password.value = doc.get('password');
        }
      }
      _isLoading.value = false;
    } catch(e) {
      _isLoading.value = false;
      rethrow;
    }

  }
}
