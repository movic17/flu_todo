import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../utils/constants.dart';
import '../../utils/styles.dart';
import '../../controllers/auth_controller.dart';
import '../../components/logo_text.dart';
import '../../screens/forgot_pwd/forgot_pwd.dart';
import '../../screens/tasks/tasks.dart';

class AuthScreen extends GetView<AuthController> {
  AuthScreen({Key? key}) : super(key: key);

  static const String routeName = '/auth';

  final _email = TextEditingController();
  final _pwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentication'),
        centerTitle: true,
        elevation: 3.0,
      ),
      body: Obx(
        () => ModalProgressHUD(
          inAsyncCall: controller.isLoading,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 32.0),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: LogoText(
                      size: 36.0,
                    ),
                  ),
                  TextField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kSecondaryText,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            width: 2.0,
                            color: kPrimary,
                            style: BorderStyle.solid,
                          )),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _pwd,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kSecondaryText,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          width: 2.0,
                          color: kPrimary,
                              style: BorderStyle.solid,
                            )),
                      ),
                    ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          child: const Text('SIGN IN'),
                          style: authBtnStyle(
                            primary: kOnPrimary,
                            backgroundColor: kPrimary,
                          ),
                          onPressed: () {
                            controller.signIn(
                              email: _email.text.trim(),
                              password: _pwd.text.trim(),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Expanded(
                        child: TextButton(
                          child: const Text('SIGN UP'),
                          style: authBtnStyle(
                            primary: kPrimary,
                            backgroundColor: kPrimaryLight,
                          ),
                          onPressed: () {
                            controller.signUp(
                              email: _email.text.trim(),
                              password: _pwd.text.trim(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  TextButton.icon(
                    onPressed: () {
                      // Get.offAllNamed(TasksScreen.routeName);
                      Get.toNamed(ForgotPwdScreen.routeName);
                    },
                    icon: const Icon(Icons.lock_outline_rounded),
                    label: const Text('Forgot your password?'),
                    style: authBtnStyle(
                      primary: kPrimary,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
