import 'package:get/get.dart';
import '../screens/splash/splash.dart';
import '../screens/auth/auth.dart';
import '../screens/tasks/tasks.dart';
import '../screens/forgot_pwd/forgot_pwd.dart';
import '../controllers/bindings/tasks_bindings.dart';
import '../controllers/bindings/forgot_pwd_bindings.dart';

class Routes {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: SplashScreen.routeName,
        page: () => const SplashScreen(),
      ),
      GetPage(
        name: AuthScreen.routeName,
        page: () => AuthScreen(),
      ),
      GetPage(
        name: TasksScreen.routeName,
        page: () => TasksScreen(),
        binding: TasksBinding(),
      ),
      GetPage(
        name: ForgotPwdScreen.routeName,
        page: () => ForgotPwdScreen(),
        binding: ForgotPwdBinding()
      ),
    ];
  }
}
