import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/features/demo/presentation/bloc/demo_bloc.dart';

class ColumnNames extends StatefulWidget {
  final PlatformFile csvFile;

  const ColumnNames({Key? key, required this.csvFile}) : super(key: key);

  @override
  _ColumnNamesState createState() => _ColumnNamesState();
}

class _ColumnNamesState extends State<ColumnNames> {
  List<List<dynamic>> csvData = [];

  @override
  void initState() {
    super.initState();
    // Load CSV data when the widget initializes
    _loadCSV(widget.csvFile);
  }

  Future<void> _loadCSV(PlatformFile file) async {
    try {
      final Uint8List? fileBytes = await file.bytes;
      final String csvString = String.fromCharCodes(fileBytes!);

      csvData = CsvToListConverter().convert(csvString);

      // Notify the widget that state has changed
      setState(() {});
    } catch (e) {
      // Handle error loading CSV file
      print('Error loading CSV file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 500,
      color: Colors.white.withOpacity(0.3),
      child: Center(
        child: Align(
          alignment: Alignment.center,
          child: ListView.builder(
            itemCount: csvData.isEmpty
                ? 0
                : (csvData[0].length > 10 ? 10 : csvData[0].length),
            scrollDirection: Axis.vertical, // Changed to vertical
            itemBuilder: (context, columnIndex) {
              String columnName =
                  csvData.isNotEmpty ? csvData[0][columnIndex].toString() : '';
              return GestureDetector(
                onTap: () {
                  // Handle click action here
                  print('Clicked on column: $columnName');
                  context.read<DemoBloc>().add(DownloadIndecator());
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  margin: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black), // Added border
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    columnName,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
