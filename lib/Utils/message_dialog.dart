import 'package:flutter/material.dart';

import '../Styles/colors.dart';

void successDialog(String? message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message!,
        style: const TextStyle(color: white),
      ),
      backgroundColor: primaryColor,
    ),
  );
}

void errorDialog(String? message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message!,
        style: const TextStyle(color: white),
      ),
      backgroundColor: red,
    ),
  );
}
