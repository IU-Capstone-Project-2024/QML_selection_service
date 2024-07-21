import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/common/enums/state.dart';
import 'package:http/http.dart' as http;

import '../../../app/bloc/app_bloc.dart';
import '../../../app/bloc/report.dart';
import '../../../core/routing/navigation.dart';

class ReportsForm extends StatelessWidget {
  const ReportsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      final id = state.id;
      return (state.state == InputState.initial)
          ? SizedBox(
              height: 60,
              width: 60,
              child: CircularProgressIndicator(
                color: Colors.blue,
                strokeWidth: 6.0,
              ),
            )
          : Column(
              children: [
                SizedBox(
                  height: 75,
                ),
                Flexible(
                  child: ListView.builder(
                    itemCount: state.reports.length,
                    itemBuilder: (context, index) {
                      final report = state.reports[index];
                      return ReportItem(
                        report: report,
                        onShow: () {
                          NavigationManager.goToTheReportPage(report.url);
                          print('Showing report: ${report.url}');
                        },
                        onDelete: () {
                          context
                              .read<AppBloc>()
                              .add(DeleteReport(url: report.url));
                        },
                      );
                    },
                  ),
                ),
              ],
            );
    });
  }
}

class ReportItem extends StatelessWidget {
  final Report report;
  final VoidCallback onShow;
  final VoidCallback onDelete;

  ReportItem({
    required this.report,
    required this.onShow,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: ElevatedButton(
          onPressed: onShow,
          child: Text('Show Report'),
        ),
        title: Text(
          'ID: ${report.id}\nCreated At: ${report.created_at}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
