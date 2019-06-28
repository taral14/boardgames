import 'package:boardgame/models/remote_boardgame.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AddBoardgameEvent {
  AddBoardgameEvent([List props = const []]);
}

class SearchRemoteEvent extends AddBoardgameEvent {
  final String term;
  SearchRemoteEvent({this.term});
}

class SelectRemoteEvent extends AddBoardgameEvent {
  final RemoteBoardgame model;

  SelectRemoteEvent({this.model});
}

class OpenForm extends AddBoardgameEvent {}
