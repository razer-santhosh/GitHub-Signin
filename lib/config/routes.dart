import 'package:go_router/go_router.dart';

import '../login/login_view.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const LoginScreen();
      },
    ),
  ],
);