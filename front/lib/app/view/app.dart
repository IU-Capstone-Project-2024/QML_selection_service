import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/locator.dart';
import '../../core/routing/app_router.dart';
import '../bloc/app_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>.value(
      value: getIt<AppBloc>(),
      child: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state.isVerified) {
            context.read<AppBloc>().add(AmountOfReports());
            AppRouter.router.go('/home/${state.id}');
            Timer.periodic(Duration(seconds: 25), (Timer timer) {
              context.read<AppBloc>().add(AmountOfReports());
            });
          } else {
            AppRouter.router.go('/login');
          }
        },
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          title: 'QML Selection Service',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
        ),
      ),
    );
  }
}