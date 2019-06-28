import 'package:meta/meta.dart';

class Boardgame {
  final String title;
  final List<int> bestNumber;
  final List<int> recNumber;
  final int playersMin;
  final int playersMax;

  Boardgame({
    @required this.title,
    @required this.bestNumber,
    @required this.recNumber,
    @required this.playersMin,
    @required this.playersMax,
  });

  static Boardgame fromJson(Map<String, dynamic> data) {
    return Boardgame(
      title: data['title'],
      bestNumber: List.from(data['bestNumber']),
      recNumber: List.from(data['recNumber']),
      playersMin: data['playersMin'],
      playersMax: data['playersMax'],
    );
  }
}
