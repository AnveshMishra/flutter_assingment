import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/common/widgets/dots_loader.dart';
import 'package:flutter_assignment/core/common/widgets/snackbar.dart';
import 'package:flutter_assignment/core/theme/app_colors.dart';
import 'package:flutter_assignment/features/auth/presentaion/bloc/auth_bloc.dart';
import 'package:flutter_assignment/features/auth/presentaion/pages/signup_page.dart';
import 'package:flutter_assignment/features/auth/presentaion/widgets/auth_text_field.dart';
import 'package:flutter_assignment/features/dashboard/presentation/pages/dashboard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

const String loginRoute = '/';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign In.",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
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
                        context.read<AuthBloc>().add(AuthLogin(
                            email: _emailController.text,
                            password: _passwordController.text));
                      },
                      child: const Text("Sign In"),
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
                                context.go(signUpRoute);
                              },
                              child: Text(
                                'Sign Up',
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
                  label: "Login success!",
                  bgColor: AppColors.appSuccessColor,
                );
                context.goNamed(dashboardRoute);
              }
            }),
          ],
        ),
      ),
    );
  }
}
