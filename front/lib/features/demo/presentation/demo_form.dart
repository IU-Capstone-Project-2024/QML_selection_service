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
      width: 500,
      height: 500,
      color: Colors.white.withOpacity(0.3),
      child: const Center(
        child: Column(
          children: [
            Text(
              'Instruction',
              style: TextStyle(fontSize: 30),
            )
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
