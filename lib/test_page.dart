import 'package:flutter/material.dart';
import 'results_page.dart';

class TestPage extends StatelessWidget {
  final bool isColorBlindnessTest;
  final int photoIndex;
  final List<int> responses;

  TestPage({required this.isColorBlindnessTest, required this.photoIndex, required this.responses});

  final List<String> colorBlindnessPhotos = [
    'assets/color_blindness_1.jpg',
    'assets/color_blindness_2.jpg',
    'assets/color_blindness_3.jpg',
    'assets/color_blindness_4.jpg',
    'assets/color_blindness_5.jpg',
  ];

  final List<String> lowVisionPhotos = [
    'assets/low_vision_1.jpg',
    'assets/low_vision_2.jpg',
    'assets/low_vision_3.jpg',
    'assets/low_vision_4.jpg',
    'assets/low_vision_5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    List<String> photos = isColorBlindnessTest ? colorBlindnessPhotos : lowVisionPhotos;

    return Scaffold(
      appBar: AppBar(
        title: Text(isColorBlindnessTest ? 'Color Blindness Test' : 'Low Vision Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(photos[photoIndex]),
            SizedBox(height: 20),
            for (int i = 1; i <= 4; i++) // Assuming 4 options per question
              ElevatedButton(
                onPressed: () {
                  List<int> updatedResponses = List.from(responses);
                  updatedResponses.add(i); // Add the selected option to the responses

                  if (photoIndex < photos.length - 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TestPage(
                          isColorBlindnessTest: isColorBlindnessTest,
                          photoIndex: photoIndex + 1,
                          responses: updatedResponses,
                        ),
                      ),
                    );
                  } else if (isColorBlindnessTest) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TestPage(isColorBlindnessTest: false, photoIndex: 0, responses: updatedResponses),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultsPage(responses: updatedResponses),
                      ),
                    );
                  }
                },
                child: Text('Option $i'),
              ),
          ],
        ),
      ),
    );
  }
}
