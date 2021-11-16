import 'package:flutter/material.dart';

/// Auth Button style
ButtonStyle authBtnStyle({Color? primary, Color? backgroundColor}) {
  return TextButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    primary: primary,
    backgroundColor: backgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    textStyle: const TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 16.0,
    ),
  );
}
