import 'package:flutter/material.dart';
import 'package:myapp_flutter/week_06/EXERCISE-4/model/Joke_data_model.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
        ),
        body: const Column(
          children: [FavoriteCard(), FavoriteCard(), FavoriteCard()],
        ),
      ),
    ));

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({
    super.key, required this.dataModel,
  });

  final JokeDataModel dataModel; 

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool _isFavorite = false;

  void onFavoriteClick() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: .5, color: Colors.grey),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dataModel.Joke,
                    style: TextStyle(
                        color: appColor, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'description',
                    style: TextStyle(
                      color: appColor, fontWeight: FontWeight.w700
                    ),
                  )
                ],
              ),
            ),
            IconButton(
                onPressed: onFavoriteClick,
                icon: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: _isFavorite ? Colors.red : Colors.grey,
                ))
          ],
        ),
      ),
      ],
      
    );
  }
}


