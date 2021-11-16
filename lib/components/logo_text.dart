import 'package:flutter/material.dart';
import '../utils/constants.dart';

class LogoText extends StatelessWidget {
  const LogoText({Key? key, this.size, this.color}) : super(key: key);
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      'FluTodo',
      style: TextStyle(
        fontFamily: 'Pacifico',
        fontSize: size ?? 20.0,
        fontWeight: FontWeight.w900,
        letterSpacing: 1.5,
        color: color ?? kPrimary,
      ),
    );
  }
}
