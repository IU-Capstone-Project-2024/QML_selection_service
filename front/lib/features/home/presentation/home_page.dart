import 'package:flutter/material.dart';
import 'package:front/common/background/background.dart';
import 'package:front/features/home/presentation/home_form.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.controller});
  final TabController controller;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          const GradientBackground(),
          HomeForm(controller: controller),
        ],
      ),
    );
  }
}
