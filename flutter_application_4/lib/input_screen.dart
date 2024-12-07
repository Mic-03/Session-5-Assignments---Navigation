import 'package:flutter/material.dart';
import 'dynamic_screen.dart';

class InputScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Input Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter number of screens'),
            ),
            ElevatedButton(
              onPressed: () {
                final int count = int.tryParse(_controller.text) ?? 0;
                for (int i = 1; i <= count; i++) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DynamicScreen(screenNumber: i),
                    ),
                  );
                }
              },
              child: const Text('Generate Screens'),
            ),
          ],
        ),
      ),
    );
  }
}
