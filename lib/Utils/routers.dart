import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageNavigator {
  PageNavigator({this.ctx});

  BuildContext? ctx;

  //Navigate to next page
  Future nextPage({Widget? page}) {
    return Navigator.push(
      ctx!,
      CupertinoPageRoute(
        builder: ((context) => page!),
      ),
    );
  }

  void nextPageOnly({Widget? page}) {
    Navigator.pushAndRemoveUntil(
        ctx!, MaterialPageRoute(builder: (context) => page!), (route) => false);
  }

  void nextPageOnlyAnim({Widget? page}) {
    Navigator.pushAndRemoveUntil(ctx!,
        CupertinoPageRoute(builder: (context) => page!), (route) => false);
  }
}
