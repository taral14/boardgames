import 'package:boardgame/screens/add_boardgame.dart';
import 'package:boardgame/screens/home.dart';
import 'package:flutter/material.dart';

MaterialPageRoute generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
          builder: (context) => HomePage(title: 'Flutter Demo Home Page'));
      break;
    case '/add-boardgame':
      return MaterialPageRoute(
          builder: (context) => AddBoardgameScreen(title: 'Add boardgame'));
      break;
  }
  return null;
}
