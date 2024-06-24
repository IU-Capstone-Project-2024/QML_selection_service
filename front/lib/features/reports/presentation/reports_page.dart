import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/background/background.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

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
