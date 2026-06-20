import 'package:flutter/material.dart';

void main() {
  runApp(const ImageViewerApp());
}

class ImageViewerApp extends StatelessWidget {
  const ImageViewerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageViewerScreen(),
    );
  }
}

class ImageViewerScreen extends StatefulWidget {
  const ImageViewerScreen({super.key});

  @override
  State<ImageViewerScreen> createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  final List<String> imagePaths = [
    'assets/w4-s2/bird.jpg',
    'assets/w4-s2/bird2.jpg',
    'assets/w4-s2/insect.jpg',
    'assets/w4-s2/girl.jpg',
    'assets/w4-s2/man.jpg',
  ];

  int currentIndex = 0;

  void showNextImage() {
    if (currentIndex < imagePaths.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void showPreviousImage() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: Text('Image Viewer'),
        actions: [
          IconButton(
            icon: Icon(Icons.navigate_before),
            tooltip: 'Previous image',
            onPressed: showPreviousImage,
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Next image',
            onPressed: showNextImage,
          ),
          const SizedBox(width: 30),
        ],
      ),
      body: Center(
        child: Image.asset(
          imagePaths[currentIndex],
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}