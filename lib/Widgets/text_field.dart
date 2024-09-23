import 'package:flutter/material.dart';

import '../Styles/colors.dart';
import '../Styles/text_style.dart';

Widget customTextField({
  String? title,
  String? hint,
  TextEditingController? controller,
  int maxlines = 1,
}) {
  return Column(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          title!,
          style: titleTextstyle,
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: lightGrey,
        ),
        child: TextFormField(
          controller: controller,
          maxLines: maxlines,
          decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none,
          ),
        ),
      )
    ],
  );
}
