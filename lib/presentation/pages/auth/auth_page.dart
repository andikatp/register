import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_dicoding/presentation/pages/auth/cubit/auth_cubit.dart';
import 'package:register_dicoding/presentation/pages/auth/widgets/custom_button_login.dart';
import 'package:register_dicoding/presentation/pages/auth/widgets/custom_button_register.dart';
import 'package:register_dicoding/presentation/core/widgets/custom_textfield.dart';
import '../../../injection.dart';

class AuthPageWrapperProvider extends StatelessWidget {
  const AuthPageWrapperProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: const AuthPage(),
    );
  }
}

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  bool _registerModeOn = false;

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentication'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (_registerModeOn)
                  CustomTextfield(
                    controller: _nameController,
                    labelText: 'Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                CustomTextfield(
                  controller: _emailController,
                  labelText: 'Email',
                  validator: (value) {
                    final RegExp emailRegex = RegExp(
                      r'^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$',
                      caseSensitive: false,
                      multiLine: false,
                    );
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    } else if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                _registerModeOn
                    ? CustomButtonRegister(
                        formKey: _formKey,
                        nameController: _nameController,
                        emailController: _emailController,
                        passwordController: _passwordController,
                      )
                    : CustomButtonLogin(
                        formKey: _formKey,
                        emailController: _emailController,
                        passwordController: _passwordController),
                TextButton(
                  onPressed: () {
                    setState(() => _registerModeOn = !_registerModeOn);
                  },
                  child: Text(
                      _registerModeOn ? 'Login Instead' : 'Sign Up Instead'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
