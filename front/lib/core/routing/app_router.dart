import 'package:front/features/login/presentation/login_page.dart';
import 'package:go_router/go_router.dart';

import '../../features/signup/signup_page.dart';

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
    ],
  );
}
