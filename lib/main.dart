import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/splash/splash.dart';
import 'utils/constants.dart';
import 'utils/routes.dart';
import 'controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData.light();
    return GetMaterialApp(
      title: 'FluTodo',
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        primaryColor: kPrimary,
        colorScheme: theme.colorScheme.copyWith(secondary: kSecondary),
        scaffoldBackgroundColor: kWhite,
      ),
      onInit: () {
        Get.put(AuthController(), permanent: true);
      },
      initialRoute: SplashScreen.routeName,
      getPages: Routes.getPages(),
    );
  }
}
