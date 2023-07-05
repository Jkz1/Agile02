import 'package:flutter/material.dart';

class MyCard {
  final String name;
  final String username;
  final String category;
  final imagePath;

  MyCard(
      {required this.name,
      required this.username,
      required this.imagePath,
      required this.category});
}

class MyCardProvider with ChangeNotifier {
  List<MyCard> _cards = [
    MyCard(
        name: 'Jokowi',
        username: 'jokowi',
        imagePath: 'assets/jokowi.jpg',
        category: 'gamer'),
    MyCard(
        name: 'Jokowi ajah',
        username: 'jokowi2',
        imagePath: 'assets/jokowi.jpg',
        category: 'gamer'),
    MyCard(
        name: 'Jokowi gaming',
        username: 'jokowi3',
        imagePath: 'assets/jokowi.jpg',
        category: 'gamer'),
    MyCard(
        name: 'Jokowi nasution',
        username: 'jokowi4',
        imagePath: 'assets/jokowi.jpg',
        category: 'gamer'),
    MyCard(
        name: 'Jokowi 3 period',
        username: 'jokowi5',
        imagePath: 'assets/jokowi.jpg',
        category: 'gamer'),
  ];

  List<MyCard> get cards => _cards;
}
