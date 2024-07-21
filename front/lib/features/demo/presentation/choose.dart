import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/demo_bloc.dart';

class Choose extends StatelessWidget {
  const Choose({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DemoBloc, DemoState>(
      builder: (context, state) => Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
              height: 50,
            ),
            _ChooseButton()
          ],
        ),
      ),
    );
  }
}

class _ChooseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DemoBloc, DemoState>(
      builder: (context, state) => ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
        ),
        onPressed: () {
          context.read<DemoBloc>().add(ListColumns());
        },
        child: const Text('Choose target column...'),
      ),
    );
  }
}
