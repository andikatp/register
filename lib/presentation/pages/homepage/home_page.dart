import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Dah Login ni Ges!'),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  context.goNamed('auth');
                },
                child: const Text('Logout!')),
          ],
        ),
      ),
    );
  }
}
