import 'package:get/get.dart';
import '../models/user.dart';
import '../services/user_service.dart';
import 'auth_controller.dart';

class UserController extends GetxController {
  final _myUser = UserModel().obs;

  @override
  void onInit() async {
    var uid = Get.find<AuthController>().authUser == null
        ? Get.find<AuthController>().authUser
        : Get.find<AuthController>().authUser!.uid;
    _myUser.value = await UserService().getMyUser(uid);
    super.onInit();
  }

  set myUser(UserModel myUser) => _myUser.value = myUser;
  UserModel get myUser => _myUser.value;

  void clear() => _myUser.value = UserModel();
}
