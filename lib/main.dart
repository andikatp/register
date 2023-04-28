import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:register_dicoding/presentation/pages/homepage/home_page.dart';
import 'package:register_dicoding/presentation/pages/register/register_page.dart';
import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const RegisterPageWrapperProvider();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'homepage',
              builder: (BuildContext context, GoRouterState state) {
                return const HomePage();
              },
            ),
          ],
        ),
      ],
    );
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      routerConfig: router,
    );
  }
}
