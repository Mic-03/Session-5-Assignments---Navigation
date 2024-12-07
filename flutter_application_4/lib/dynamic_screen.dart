import 'package:flutter/material.dart';

class DynamicScreen extends StatelessWidget {
  final int screenNumber;

  DynamicScreen({required this.screenNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dynamic Screen $screenNumber')),
      body: Center(
        child: Text('This is dynamic screen $screenNumber'),
      ),
    );
  }
}
