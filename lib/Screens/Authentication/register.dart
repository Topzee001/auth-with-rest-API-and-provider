import 'package:auth_restapi_provider/Provider/AuthProvider/auth_provider.dart';
import 'package:auth_restapi_provider/Screens/Authentication/login.dart';
import 'package:auth_restapi_provider/Utils/routers.dart';
import 'package:auth_restapi_provider/Widgets/button.dart';
import 'package:auth_restapi_provider/Widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Utils/message_dialog.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    emailController.clear();
    passwordController.clear();
    firstNameController.clear();
    lastNameController.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  customTextField(
                    controller: firstNameController,
                    title: 'First name',
                    hint: 'Enter your first name',
                  ),
                  customTextField(
                    controller: lastNameController,
                    title: 'Last name',
                    hint: 'Enter your last name',
                  ),
                  customTextField(
                    controller: emailController,
                    title: 'Email',
                    hint: 'Enter a valid email',
                  ),
                  customTextField(
                    controller: passwordController,
                    title: 'Password',
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
                        text: 'Register',
                        tap: () {
                          if (emailController.text.isEmpty ||
                              passwordController.text.isEmpty ||
                              firstNameController.text.isEmpty ||
                              lastNameController.text.isEmpty) {
                            errorMessage(
                              //   message:
                              "All fields are required",
                              // context:
                              context,
                            );
                          } else {
                            auth.registerUser(
                              context: context,
                              firstName: firstNameController.text.trim(),
                              lastName: lastNameController.text.trim(),
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                          }
                        },
                        context: context,
                        status: auth.isLoading,
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    child: Text('Login Instead'),
                    onTap: () {
                      PageNavigator(ctx: context)
                          .nextPageOnlyAnim(page: LoginPage());
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
