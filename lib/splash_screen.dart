import 'package:auth_restapi_provider/Screens/Authentication/login.dart';
import 'package:auth_restapi_provider/Utils/routers.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }

  void navigate() {
    Future.delayed(const Duration(seconds: 3), () {
      PageNavigator(ctx: context).nextPageOnly(page: const LoginPage());
    });
  }
}
