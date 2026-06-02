//Part1
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Hobbies'),
        ),
        body: Container(
          color: Colors.grey,
          padding: EdgeInsets.only(
            left: 40,
            right: 40,
            top: 40,
            bottom: 40,
          ),
          child: Column(
            children: [
              Container(
                height: 100,
                padding: EdgeInsets.only(left: 30, right: 20),
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.travel_explore,
                      color: Colors.white,
                      size: 32,
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Travelling',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              Container(
                height: 100,
                padding: EdgeInsets.only(left: 30, right: 20),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.skateboarding,
                      color: Colors.white,
                      size: 32,
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Skating',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}


//Part2
import 'package:flutter/material.dart';

class HobbyCard extends StatelessWidget {
  const HobbyCard({super.key, required this.title, required this.icon, this.backgroundColor = Colors.blue});
  final String title;
  final IconData icon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
                height: 100,
                padding: EdgeInsets.only(left: 30, right: 20),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(icon, color: Colors.white, size: 32),
                    SizedBox(width: 20),
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
            );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My Hobbies')),
        body: Container(
          color: Colors.grey,
          padding: EdgeInsets.only(left: 40, right: 40, top: 40, bottom: 40),

          child: Column(
            children: [
              HobbyCard(title: 'Travel', icon: Icons.travel_explore, backgroundColor: Colors.lightGreen),
              SizedBox(height: 20,),
              HobbyCard(title: 'Skating', icon: Icons.skateboarding, backgroundColor: Colors.blueGrey)
            ],
          ),
        ),
      ),
    ),
  );
}
