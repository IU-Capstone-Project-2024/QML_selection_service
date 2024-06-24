import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

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
    );
  }
}

class _ImportButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        peakFile();
      },
      child: const Text('Import data'),
    );
  }

  Future<void> peakFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    //ToDo connect with backend (VechkanovVV)
  }
}
