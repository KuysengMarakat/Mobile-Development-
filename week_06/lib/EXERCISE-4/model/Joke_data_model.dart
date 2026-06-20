import 'package:flutter/material.dart';

class JokeDataModel {
  final List<Tiles> tile;

  JokeDataModel(this.tile);
}

class Tiles {
  final String title;
  final String description;

  Tiles({required this.title, required this.description});
}
