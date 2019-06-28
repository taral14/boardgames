import 'package:boardgame/models/remote_boardgame.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RemoteBoardgameRepository {
  Future<List<RemoteBoardgame>> search(String term) async {
    var response =
        await http.get('http://bg.filmun.net/boardgame/search?term=$term');

    List<dynamic> list = jsonDecode(response.body);

    return list.map((item) => RemoteBoardgame.fromJson(item)).toList();
  }
}
