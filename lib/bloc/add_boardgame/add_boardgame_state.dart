import 'package:boardgame/models/remote_boardgame.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AddBoardgameState extends Equatable {
  AddBoardgameState([List props = const []]) : super(props);
}

class InitialAddBoardgameState extends AddBoardgameState {}

class DisplaySearchResults extends AddBoardgameState {
  final loading;
  final List<RemoteBoardgame> models;
  final String term;

  DisplaySearchResults(
      {this.loading = false, @required this.models, this.term = ''})
      : super([loading, models, term]);
}

class BoardgameForm extends AddBoardgameState {
  final String title;
  final List<int> bestNumber;
  final List<int> recNumber;
  final int playersMin;
  final int playersMax;

  BoardgameForm({
    this.title,
    this.bestNumber,
    this.recNumber,
    this.playersMin,
    this.playersMax,
  }) : super([
          title,
          bestNumber,
          recNumber,
          playersMin,
          playersMax,
        ]);
}
