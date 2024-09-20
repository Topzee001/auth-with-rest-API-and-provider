import 'package:flutter/material.dart';

void messageDialog(String? message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message!),
    ),
  );
}
