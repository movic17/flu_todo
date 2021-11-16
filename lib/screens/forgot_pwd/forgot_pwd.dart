import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/logo_text.dart';
import '../../utils/constants.dart';
import '../../controllers/forgot_pwd_controller.dart';

class ForgotPwdScreen extends GetView<ForgotPwdController> {
  ForgotPwdScreen({Key? key}) : super(key: key);

  final _email = TextEditingController();

  static const String routeName = '/forgot_pwd';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recovery'),
        centerTitle: true,
        elevation: 3.0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 26.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'password recovery',
              style: TextStyle(
                color: kPrimaryText,
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
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
              decoration: const InputDecoration(
                  hintText: 'Enter your email', hintStyle: TextStyle()),
            ),
            TextButton(
              onPressed: () {
                if (_email.text != '') {
                  controller.displayPassword(_email.text.trim());
                }
              },
              child: Obx(() {
                if (controller.isLoading) {
                  return const CircularProgressIndicator();
                }
                return const Text(
                  'Get your password',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    color: kPrimary,
                  ),
                );
              }),
            ),
            const SizedBox(height: 26.0),
            const Text(
              'Password:',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Obx(
                () {
                  if (controller.password.isEmpty) {
                    return const Text('Loading ..');
                  }
                  return Text(
                    controller.password,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic,
                        color: kSecondaryText),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
