import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.black.withOpacity(0.3), // Transparent background
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Please wait...',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text color for better visibility
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                width: 500.0,
                height: 10.0,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
