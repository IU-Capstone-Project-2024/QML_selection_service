import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class DemoForm extends StatelessWidget {
  const DemoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
      ),
      onPressed: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();
        if (result != null) {
          if (kDebugMode) {
            print('File picked: ${result.files.single.path}');
          }
          String? path = result.files.single.path;
          if (path == null) {
            if (kDebugMode) {
              print('Error: File path is null');
            }
            return;
          }

          File file = File(path);
          final Uri url = Uri.parse('http://localhost:8181/api/uploadCsv');
          var request = http.MultipartRequest('POST', url);
          request.files.add(
            await http.MultipartFile.fromPath(
              'file',
              file.path,
              contentType: MediaType('text', 'csv'),
            ),
          );

          final streamedResponse = await request.send();
          final response = await http.Response.fromStream(streamedResponse);

          if (response.statusCode == 200) {
            if (kDebugMode) {
              print('Файл успешно загружен');
            }
          } else {
            if (kDebugMode) {
              print('Ошибка при загрузке файла: ${response.statusCode}');
            }
          }
        } else {
          if (kDebugMode) {
            print('Error: No file picked');
          }
        }
      },
      child: const Text('Import data'),
    );
  }
}
