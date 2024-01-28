import 'package:go_router/go_router.dart';

import '../screens/repoDetails/repoDetailsView.dart';
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
    GoRoute(
      path: '/repo-details',
      builder: (context, state) {
        List<dynamic> params = state.extra as List<dynamic>;
        return RepoDetailsView(
          branchList: params[0],
          branchDetailsUrl: params[1],
          repoName: params[2],
        );
      },
    ),
  ],
);
