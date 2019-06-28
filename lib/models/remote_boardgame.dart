import 'package:meta/meta.dart';

class RemoteBoardgame {
  final String title;
  final String photoUrl;
  final String description;
  final List<int> bestNumber;
  final List<int> recNumber;
  final int playersMin;
  final int playersMax;

  RemoteBoardgame({
    @required this.title,
    @required this.photoUrl,
    @required this.description,
    @required this.bestNumber,
    @required this.recNumber,
    @required this.playersMin,
    @required this.playersMax,
  });

  static RemoteBoardgame fromJson(Map<String, dynamic> data) {
    return RemoteBoardgame(
      title: data['title'],
      photoUrl: data['photoUrl'],
      description: data['description'] ?? '',
      bestNumber: List.from(data['bestNumber']),
      recNumber: List.from(data['recNumber']),
      playersMin: data['playersMin'],
      playersMax: data['playersMax'],
    );
  }
}
