import 'package:flutter/material.dart';
import 'test_page.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Introduction'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TestPage(isColorBlindnessTest: true, photoIndex: 0, responses: []),
              ),
            );
          },
          child: Text('Start Test'),
        ),
      ),
    );
  }
}
