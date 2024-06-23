import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/core/routing/navigation.dart';
import 'package:go_router/go_router.dart';

import '../../core/di/locator.dart';
import '../../core/routing/app_router.dart';
import '../bloc/app_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (_) => getIt<AppBloc>(),
      child: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state.isVerified) {
            AppRouter.router.go('/home');
          } else {
            AppRouter.router.go('/login');
          }
        },
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
        ),
      ),
    );
  }
}
