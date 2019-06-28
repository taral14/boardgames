import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:boardgame/repositories/remote_boardgame_repository.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

class AddBoardgameBloc extends Bloc<AddBoardgameEvent, AddBoardgameState> {
  final RemoteBoardgameRepository repository;

  AddBoardgameBloc({@required this.repository});

  @override
  AddBoardgameState get initialState => InitialAddBoardgameState();

  @override
  Stream<AddBoardgameState> mapEventToState(
    AddBoardgameEvent event,
  ) async* {
    if (event is SearchRemoteEvent) {
      yield* mapSearchEventToState(event);
    } else if (event is SelectRemoteEvent) {
      yield* mapSelectEventToState(event);
    }
  }

  Stream<BoardgameForm> mapSelectEventToState(SelectRemoteEvent event) async* {
    var model = event.model;
    yield BoardgameForm(
      title: model.title,
      bestNumber: model.bestNumber,
      recNumber: model.recNumber,
      playersMin: model.playersMin,
      playersMax: model.playersMax,
    );
  }

  Stream<DisplaySearchResults> mapSearchEventToState(
      SearchRemoteEvent event) async* {
    if (currentState is DisplaySearchResults) {
      var state = currentState as DisplaySearchResults;
      yield DisplaySearchResults(
          models: state.models, loading: true, term: event.term);
    }

    var models = await this.repository.search(event.term);
    yield DisplaySearchResults(
        models: models, loading: false, term: event.term);
  }
}
