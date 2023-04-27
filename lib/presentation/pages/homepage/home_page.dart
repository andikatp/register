import 'package:flutter/material.dart';

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
            ElevatedButton(onPressed: () {}, child: const Text('Logout!')),
          ],
        ),
      ),
    );
  }
}
