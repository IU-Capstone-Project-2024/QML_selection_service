import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/core/di/di_exports.dart';
import 'package:front/features/reports/presentation/reports_form.dart';
import '../../../common/background/background.dart';
import '../../../common/counter/counter.dart';
import '../../../core/di/locator.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GradientBackground(),
          Center(
            child: ReportsForm(),
          ),
          Counter(),
        ],
      ),
    );
  }
}
