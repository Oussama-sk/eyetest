import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final List<int> responses;

  ResultsPage({required this.responses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your results:', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            for (int i = 0; i < responses.length; i++)
              Text('Response to Question ${i + 1}: Option ${responses[i]}'),
          ],
        ),
      ),
    );
  }
}
