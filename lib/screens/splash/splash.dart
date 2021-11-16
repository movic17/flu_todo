import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/logo_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const [
            LogoText(size: 36.0,),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Loading ..'),
            ),
          ],
        ),
      ),
    );
  }
}
