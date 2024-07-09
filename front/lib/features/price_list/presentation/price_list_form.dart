import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class PriceListForm extends StatefulWidget {
  const PriceListForm({super.key});

  @override
  _PriceListFormState createState() => _PriceListFormState();
}

class _PriceListFormState extends State<PriceListForm> {
  String selectedInstruction = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _Instruction1(
                onTap: () {
                  setState(() {
                    selectedInstruction = 'Example 1';
                  });
                },
                isSelected: selectedInstruction == 'Example 1',
              ),
              _Instruction2(
                onTap: () {
                  setState(() {
                    selectedInstruction = 'Example 2';
                  });
                },
                isSelected: selectedInstruction == 'Example 2',
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          _ImportButton(isEnabled: selectedInstruction.isNotEmpty, text: selectedInstruction.isEmpty ? 'Confirm selection' : '$selectedInstruction selected'),
        ],
      ),
    );
  }
}

class _Instruction1 extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSelected;

  const _Instruction1({required this.onTap, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 500,
        height: 500,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 5,
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Example 1',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Instruction2 extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSelected;

  const _Instruction2({required this.onTap, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 500,
        height: 500,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 5,
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Example 2',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImportButton extends StatelessWidget {
  final bool isEnabled;
  final String text;

  const _ImportButton({required this.isEnabled, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
        backgroundColor: MaterialStateProperty.all<Color>(isEnabled ? Colors.blue : Colors.grey),
      ),
      onPressed: isEnabled
          ? () {
        // Implement your logic here
      }
          : null,
      child: Text(text),
    );
  }
}
