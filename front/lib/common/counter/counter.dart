import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../app/bloc/app_bloc.dart';

@injectable
class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        var count = state.counter;
        return Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
          ),
          child: Text(
            'Reports left: ${count}',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
