import 'package:flutter/material.dart';
import 'package:web/features/login/presentation/login_page.dart';

import 'core/di/locator.dart';

void main() {
  configureDependencies();
  runApp(const Web());
}

class Web extends StatelessWidget {
  const Web({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
