import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/theme/app_colors.dart';
import 'package:flutter_assignment/features/auth/presentaion/bloc/auth_bloc.dart';
import 'package:flutter_assignment/features/auth/presentaion/pages/login_page.dart';
import 'package:flutter_assignment/features/auth/presentaion/widgets/auth_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/dots_loader.dart';
import '../../../../core/common/widgets/snackbar.dart';

const signUpRoute = '/signup';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign Up.",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              AuthTextField(
                hintText: "Name",
                controller: _nameController,
              ),
              const SizedBox(
                height: 24,
              ),
              AuthTextField(
                hintText: "Email",
                controller: _emailController,
              ),
              const SizedBox(
                height: 24,
              ),
              AuthTextField(
                hintText: "Password",
                controller: _passwordController,
                isObsecured: true,
              ),
              const SizedBox(
                height: 24,
              ),
              BlocConsumer<AuthBloc, AuthState>(builder: (_, state) {
                if (state is AuthLoading) {
                  return const DotProgressView();
                } else {
                  return Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            context.read<AuthBloc>().add(
                                  AuthSignup(
                                    name: _nameController.text,
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                          }
                        },
                        child: const Text("Sign Up"),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      RichText(
                          text: TextSpan(
                              text: 'Already have an account? ',
                              style: Theme.of(context).textTheme.titleMedium,
                              children: [
                            WidgetSpan(
                              child: GestureDetector(
                                onTap: () {
                                  context.go(loginRoute);
                                },
                                child: Text(
                                  'Sign in',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        color: AppColors.appPurpleShade,
                                      ),
                                ),
                              ),
                            ),
                          ])),
                    ],
                  );
                }
              }, listener: (_, state) {
                if (state is AuthFailed) {
                  showSnackBar(
                    context,
                    label: state.message,
                    bgColor: AppColors.appErrorColor,
                  );
                } else if (state is AuthSuccess) {
                  showSnackBar(
                    context,
                    label: "Sign Up success! Please Login to continue",
                    bgColor: AppColors.appSuccessColor,
                  );
                  context.go(loginRoute);
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
