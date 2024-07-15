import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/features/demo/presentation/bloc/demo_bloc.dart';
import 'package:front/features/demo/presentation/choose.dart';
import 'package:front/features/demo/presentation/demo_form.dart';
import 'package:front/features/demo/presentation/wait.dart';
import '../../../common/background/background.dart';
import '../../../common/counter/counter.dart';
import '../../../core/di/locator.dart';
import 'column_names.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GradientBackground(),
          BlocProvider<DemoBloc>(
            create: (BuildContext context) => getIt<DemoBloc>(),
            child: SingleChildScrollView(
              child: BlocBuilder<DemoBloc, DemoState>(
                builder: (context, state) => (state.initial)
                    ? DemoForm()
                    : (state.medium)
                        ? Center(child: Choose())
                        : (state.last)
                            ? Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 80,
                                    ),
                                    ColumnNames(
                                      csvFile: state.file!,
                                    ),
                                  ],
                                ),
                              )
                            : Column(
                                children: [
                                  SizedBox(
                                    height: 90,
                                  ),
                                  Wait(),
                                ],
                              ),
              ),
            ),
          ),
          Counter(),
        ],
      ),
    );
  }
}
