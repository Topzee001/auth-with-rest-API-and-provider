import 'package:flutter/material.dart';

import '../Styles/colors.dart';

void successMessage(String? message, BuildContext context) {
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

void errorMessage(String? message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      //padding: const EdgeInsets.all(8),
      content: Text(
        message!,
        style: const TextStyle(color: white),
      ),
      backgroundColor: red,
    ),
  );
}
