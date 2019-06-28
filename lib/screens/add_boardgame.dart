import 'package:boardgame/bloc/add_boardgame/bloc.dart';
import 'package:boardgame/models/remote_boardgame.dart';
import 'package:boardgame/repositories/remote_boardgame_repository.dart';
import 'package:boardgame/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/boardgame_form_widget.dart';

class AddBoardgameScreen extends StatefulWidget {
  final String title;

  AddBoardgameScreen({this.title});

  @override
  State<StatefulWidget> createState() => _AddBoardgameScreenState();
}

class _AddBoardgameScreenState extends State<AddBoardgameScreen> {
  AddBoardgameBloc addBoardgameBloc;

  void initState() {
    super.initState();
    addBoardgameBloc = AddBoardgameBloc(
      repository: RemoteBoardgameRepository(),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: buildBody(),
        ));
  }

  Widget buildBody() {
    return BlocBuilder<AddBoardgameEvent, AddBoardgameState>(
      bloc: addBoardgameBloc,
      builder: (context, AddBoardgameState state) {
        if (state is DisplaySearchResults) {
          return buildResults(state);
        } else if (state is BoardgameForm) {
          return buildForm(state);
        }
        return buildSearchFiled('');
      },
    );
  }

  Widget buildForm(BoardgameForm state) {
    return BoardgameFormWidget(
      title: state.title,
      playersMin: state.playersMin,
      playersMax: state.playersMax,
      recNumber: state.recNumber,
      bestNumber: state.bestNumber,
    );
  }

  Widget buildResults(DisplaySearchResults state) {
    return Column(
      children: <Widget>[
        buildSearchFiled(state.term),
        Expanded(
          child: ListView.builder(
              itemCount: state.models.length,
              itemBuilder: (context, position) {
                RemoteBoardgame model = state.models[position];
                return ListItem(
                  model: model,
                  onTap: () {
                    addBoardgameBloc.dispatch(SelectRemoteEvent(model: model));
                  },
                );
              }),
        ),
      ],
    );
  }

  Widget buildSearchFiled(text) {
    return TextField(
      controller: TextEditingController(
        text: text,
      ),
      decoration: InputDecoration(
        hintText: 'Название настольной игры',
      ),
      style: TextStyle(fontSize: 22.0),
      onChanged: (String value) {
        addBoardgameBloc.dispatch(SearchRemoteEvent(term: value));
      },
    );
  }
}
