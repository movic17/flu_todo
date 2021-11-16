import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../models/user.dart';
import '../services/user_service.dart';
import '../screens/tasks/tasks.dart';
import '../screens/auth/auth.dart';
import 'user_controller.dart';

class AuthController extends GetxController {
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> _authUser;
  final _isLoading = false.obs;

  @override
  void onInit() {
    _authUser = Rx<User?>(_auth.currentUser);
    _authUser.bindStream(_auth.authStateChanges());
    ever(_authUser, _initialScreen);
    super.onInit();
  }

  _initialScreen(User? user) async {
    if (user == null) {
      await Get.offAllNamed(AuthScreen.routeName);
    } else {
      await Get.offAllNamed(TasksScreen.routeName);
    }
  }

  User? get authUser => _authUser.value;
  bool get isLoading => _isLoading.value;

  Future<void> signUp({String? email, String? password}) async {
    _isLoading.value = true;
    try {
      final authResult = await _auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      final myUser = UserModel(
        email: authResult.user!.email,
        displayName: authResult.user!.email!.split('@')[0],
        password: password,
      );
      if (await UserService().createNewUser(myUser, authResult.user!.uid)) {
        Get.find<UserController>().myUser = myUser;
      }
      _isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      _isLoading.value = false;
      Get.snackbar('Warning', e.message!);
    }
  }

  Future<void> signIn({String? email, String? password}) async {
    _isLoading.value = true;
    try {
      await _auth.signInWithEmailAndPassword(
          email: email!, password: password!);

      _isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      _isLoading.value = false;
      Get.snackbar('Warning', e.message!);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
