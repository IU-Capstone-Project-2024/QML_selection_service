import 'package:front/features/login/presentation/login_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/login',
        builder: (context,state) => LoginPage(),
      ),
    ],
  );
}
