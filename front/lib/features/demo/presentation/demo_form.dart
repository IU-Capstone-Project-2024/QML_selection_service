import 'dart:convert';
import 'dart:io' as io;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/app/app.dart';
import 'package:front/features/demo/presentation/bloc/demo_bloc.dart';
import 'package:http/http.dart' as http;

class DemoForm extends StatelessWidget {
  const DemoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DemoBloc, DemoState>(
      builder: (context, state) => Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            _Instruction(),
            const SizedBox(
              height: 50,
            ),
            _ImportButton(),
          ],
        ),
      ),
    );
  }
}

class _Instruction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 600,
      color: Colors.white.withOpacity(0.3),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Center(
              child: Text(
                'Instruction',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Text(
              '1. Data Requirements',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              '● File Format: Your dataset should be in CSV (Comma-Separated Values) format.\n'
              '● Data Type: All data should be numerical. Ensure that any categorical data has been appropriately encoded into numerical values prior to upload.\n'
              '● Target Column: The target column (the variable you want to predict) should be clearly specified and must also contain numerical values.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '2. Preparing Your Dataset',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              '● Ensure Data Consistency: Verify that all columns contain numerical data and that there are no missing values. Any preprocessing such as normalization, standardization, or handling of missing values should be performed before uploading the dataset.\n'
              '● Specify the Target Column: Clearly identify the target column in your dataset. This column should be distinct from the feature columns.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '3. Uploading Your Dataset',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              '● Navigate to the Upload Section: Access the upload section of the Quantum Feature Selector platform.\n'
              '● Select Your CSV File: Use the provided file selector to upload your prepared CSV file.\n'
              '● Specify the Target Column: Indicate which column is your target variable during the upload process.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '4. Running Quantum Feature Selection',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              '● Initiate Feature Selection: Once the dataset is uploaded and the target column is specified, initiate the feature selection process.\n'
              '● Quantum Annealing Processing: The platform will leverage quantum annealing algorithms to evaluate and select the most relevant features from your dataset.\n'
              '● Review Results: After the quantum processing is complete, the selected features will be presented, highlighting those that contribute most significantly to the predictive power of your machine learning model.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '5. Downloading Selected Features',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              '● Export Results: You can download the list of selected features and the transformed dataset for further analysis and use in your machine learning models.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImportButton extends StatelessWidget {
  PlatformFile? file;
  Future<void> pickAndUploadFile(String id) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (result != null) {
      PlatformFile platformFile = result.files.single;
      file = result.files.single;
      Uint8List? fileBytes = platformFile.bytes;
      String? fileName = platformFile.name;

      if (fileBytes != null && fileName != null) {
        // For web
        if (kDebugMode) {
          print('File picked: $fileName');
        }
      } else if (platformFile.path != null) {
        // For mobile and desktop
        io.File file = io.File(platformFile.path!);
        Uint8List fileBytes = await file.readAsBytes();

        if (kDebugMode) {
          print('File picked: ${platformFile.path}');
        }
      } else {
        if (kDebugMode) {
          print('Error: File path and bytes are null');
        }
      }
    } else {
      if (kDebugMode) {
        print('User canceled the picker');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, appState) {
      String id = appState.id;
      var counter = appState.counter;
      return BlocBuilder<DemoBloc, DemoState>(
        builder: (context, demoState) => ElevatedButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey; // Цвет заблокированной кнопки
                }
                return Colors.blue; // Цвет активной кнопки
              },
            ),
            foregroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.black38; // Цвет текста заблокированной кнопки
                }
                return Colors.white; // Цвет текста активной кнопки
              },
            ),
          ),
          onPressed: counter == 0
              ? null
              : () async {
                  await pickAndUploadFile(id);
                  context.read<DemoBloc>().add(AddPath(file: file!));
                  context.read<DemoBloc>().add(ChooseTarget());
                },
          child: Text(counter == 0 ? 'Buy more attempts' : 'Import data'),
        ),
      );
    });
  }
}
