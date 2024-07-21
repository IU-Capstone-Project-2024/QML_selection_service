import 'package:flutter/material.dart';
import 'package:front/features/price_list/presentation/price_list_form.dart';

import '../../../common/background/background.dart';
import '../../../common/counter/counter.dart';

class PriceListPage extends StatelessWidget {
  const PriceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          GradientBackground(),
          PriceListForm(),
          Counter(),
        ],
      ),
    );
  }
}
