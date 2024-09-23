import 'package:auth_restapi_provider/Utils/routers.dart';
import 'package:auth_restapi_provider/Widgets/button.dart';
import 'package:auth_restapi_provider/Widgets/text_field.dart';
import 'package:flutter/material.dart';

import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.clear();
    passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  customTextField(
                    title: 'Email',
                    controller: emailController,
                    hint: 'Enter a valid email address',
                  ),
                  customTextField(
                    title: 'Password',
                    controller: passwordController,
                    hint: 'Enter your password',
                  ),
                  customButton(
                    text: 'Login',
                    tap: () {},
                    context: context,
                    status: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    child: const Text('Register Instead'),
                    onTap: () {
                      PageNavigator(ctx: context)
                          .nextPage(page: const RegisterPage());
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
