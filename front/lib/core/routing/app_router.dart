import 'package:front/features/login/presentation/login_page.dart';
import 'package:front/features/navigation/presentation/navigation.dart';
import 'package:go_router/go_router.dart';

import 'package:front/features/signup/presentation/signup_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/login/signup',
        builder: (context, state) => const SignupPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const Navigation(),
      ),
    ],
  );
}
