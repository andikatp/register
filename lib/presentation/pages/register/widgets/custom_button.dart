import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../cubit/register_cubit.dart';

class CustomButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const CustomButton(
      {super.key,
      required this.formKey,
      required this.nameController,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (ctx, state) {
        if (state is RegisterLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is RegisterErrorState) {
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
        if (state is RegisterLoadedState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go('/homepage');
          });
        }
        return ElevatedButton(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              context.read<RegisterCubit>().onRegisterPressedEvent(
                    nameController.text,
                    emailController.text,
                    passwordController.text,
                  );
            }
          },
          child: const Text('Submit'),
        );
      },
    );
  }
}
