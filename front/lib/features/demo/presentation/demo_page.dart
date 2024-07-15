import 'package:flutter/material.dart';
import 'package:front/features/demo/presentation/demo_form.dart';
import '../../../common/background/background.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          GradientBackground(),
          SingleChildScrollView(
            child: DemoForm(),
          ),
        ],
      ),
    );
  }
}
