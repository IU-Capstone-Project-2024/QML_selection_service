import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/common/background/background.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          GradientBackground(),
        ],
      ),
    );
  }
}
