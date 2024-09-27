import 'package:auth_restapi_provider/Provider/AuthProvider/auth_provider.dart';
import 'package:auth_restapi_provider/Utils/message_dialog.dart';
import 'package:auth_restapi_provider/Utils/routers.dart';
import 'package:auth_restapi_provider/Widgets/button.dart';
import 'package:auth_restapi_provider/Widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                  Consumer<AuthenticationProvider>(
                    builder: (context, auth, child) {
                      WidgetsBinding.instance!.addPostFrameCallback((_) {
                        if (auth.resMessage != '') {
                          errorMessage(auth.resMessage, context);

                          auth.clear();
                        }
                      });
                      return customButton(
                        text: 'Login',
                        tap: () {
                          if (emailController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            errorMessage(
                              //   message:
                              "All fields are required",
                              // context:
                              context,
                            );
                          } else {
                            auth.loginUser(
                                context: context,
                                email: emailController.text.trim(),
                                password: passwordController.text.trim());
                          }
                        },
                        context: context,
                        status: auth.isLoading,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    child: const Text('Register Instead'),
                    onTap: () {
                      PageNavigator(ctx: context)
                          .nextPageOnlyAnim(page: const RegisterPage());
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
