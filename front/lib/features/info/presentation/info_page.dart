import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/background/background.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

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
