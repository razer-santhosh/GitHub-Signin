import 'package:go_router/go_router.dart';

import 'constants.dart';
import '../screens/dashboard/dashboardView.dart';
import '../screens/login/loginView.dart';
import '../services/githubSiginIn.dart';

// GoRouter configuration for Navigation
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) {
        print('token - ${Constants.githubToken}');
        return Constants.githubToken != null ? '/dashboard' : '/login';
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) {
        return const Dashboard();
      },
    ),
    GoRoute(
      path: '/github-sign-in',
      builder: (context, state) {
        return GitHubSignIn();
      },
    ),
  ],
);
