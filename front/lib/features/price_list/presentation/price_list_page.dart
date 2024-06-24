import 'package:flutter/material.dart';

import '../../../common/background/background.dart';

class PriceListPage extends StatelessWidget {
  const PriceListPage({super.key});

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
