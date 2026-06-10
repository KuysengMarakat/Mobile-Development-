import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];


class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  int currentIndex = 0;

  void nextImage() {
    setState(() {
      if (currentIndex == images.length - 1) {
        currentIndex = 0;
      } else {
        currentIndex++;
      }
    });
  }

  void previousImage() {
    setState(() {
      if (currentIndex == 0) {
        currentIndex = images.length - 1;
      } else {
        currentIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.navigate_before),
            onPressed: previousImage,
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: nextImage,
          ),
        ],
      ),
      body: Center(
        child: Image.asset(images[currentIndex]),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageGallery(),
    ),
  );
}