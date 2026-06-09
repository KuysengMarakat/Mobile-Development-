import 'dart:math';

import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key, required this.isFavorite,});

  final bool isFavorite;
  // final IconData iconData;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          // width: 1,
          child: Row(
            children: [
              Column(
                children: [
                  Text('Title', style: TextStyle(color: Colors.blue)),
                  Text('description'),
                ],
              ),
              Expanded(child: SizedBox(width: 300)),
              Padding(padding: EdgeInsets.all(50)),

              ElevatedButton(
                    onPressed: () {
                      setState((){
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Icon(
                        (isFavorite ? Icons.favorite : Icons.favorite_border),
                        color: isFavorite ? Colors.red : Colors.black,
                    ),
              ),
            ],
          ),
        ),
        Divider(color: Colors.black, height: 10, thickness: sqrt1_2),
      ],
    );
  }
}

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(children: [
        FavoriteButton(isFavorite: true),
        FavoriteButton(isFavorite: false),
        FavoriteButton(isFavorite: true),

        ],
      ),
    ),
  ),
);
