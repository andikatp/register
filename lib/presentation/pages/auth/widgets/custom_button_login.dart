// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubit/auth_cubit.dart';

class CustomButtonLogin extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const CustomButtonLogin({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (ctx, state) {
        if (state is AuthLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is AuthErrorState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message,
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
              ),
            );
          });
        }
        if (state is LoginLoadedState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.goNamed('homepage');
          });
        }
        return ElevatedButton(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              context.read<AuthCubit>().onLoginPressedEvent(
                  emailController.text, passwordController.text);
            }
          },
          child: const Text('Login'),
        );
      },
    );
  }
}
