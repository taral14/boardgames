import 'package:boardgame/models/remote_boardgame.dart';
import 'package:flutter/material.dart';

typedef OnSelectItem = Function();

class ListItem extends StatefulWidget {
  final RemoteBoardgame model;
  final OnSelectItem onTap;

  ListItem({this.model, this.onTap});

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        child: ListTile(
          //contentPadding: EdgeInsets.all(5),
          leading: Image.network(widget.model.photoUrl),
          title: Text(widget.model.title),
          subtitle: Text('...'),
          //isThreeLine: true,
        ),
      ),
    );
  }
}
