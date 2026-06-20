import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My hobbies'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              HobbyCard(
                title: 'Travelling',
                icon: Icons.flight_takeoff,
                backgroundColor: Colors.green,
              ),

              SizedBox(height: 10),

              HobbyCard(
                title: 'Skating',
                icon: Icons.ice_skating,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color backgroundColor;

  const HobbyCard({
    super.key,
    required this.title,
    required this.icon,
    this.backgroundColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          children: [
            const SizedBox(width: 30),

            Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),

            const SizedBox(width: 20),

            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}