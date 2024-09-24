import 'package:auth_restapi_provider/Provider/AuthProvider/auth_provider.dart';
import 'package:auth_restapi_provider/Styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/home.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: primaryColor),
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
          primaryColor: primaryColor,
        ),
        home: const SplashScreen(),
        //MyHomePage(),
      ),
    );
  }
}
