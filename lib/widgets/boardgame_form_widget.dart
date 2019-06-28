import 'package:flutter/material.dart';

class BoardgameFormWidget extends StatefulWidget {
  final String title;
  final int playersMin;
  final int playersMax;
  final List<int> recNumber;
  final List<int> bestNumber;

  BoardgameFormWidget({
    this.title,
    this.playersMin,
    this.playersMax,
    this.recNumber,
    this.bestNumber,
  });

  @override
  _BoardgameFormWidgetState createState() => _BoardgameFormWidgetState();
}

class _BoardgameFormWidgetState extends State<BoardgameFormWidget> {
  String title;
  int playersMin;
  int playersMax;
  List<int> recNumber;
  List<int> bestNumber;

  @override
  void initState() {
    this.title = widget.title;
    this.playersMax = widget.playersMax;
    this.playersMin = widget.playersMin;
    this.recNumber = widget.recNumber;
    this.bestNumber = widget.bestNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildTitleFiled(),
        SizedBox(height: 20.0),
        Row(
          children: <Widget>[
            Expanded(child: buildMinFiled()),
            SizedBox(
              width: 20.0,
            ),
            Expanded(child: buildMaxFiled()),
          ],
        ),
        SizedBox(height: 20.0),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          spacing: 5.0,
          runSpacing: 5.0,
          children: <Widget>[
            for (int n = playersMin; n <= playersMax; n++) buildNumber(n),
          ],
        ),
      ],
    );
  }

  Widget buildTitleFiled() {
    return TextField(
      controller: TextEditingController(
        text: title,
      ),
      decoration: InputDecoration(
        hintText: 'Название настольной игры',
      ),
      style: TextStyle(fontSize: 22.0),
      onChanged: (String value) {
        setState(() {
          title = value;
        });
      },
    );
  }

  Widget buildMinFiled() {
    return TextField(
      controller: TextEditingController(
        text: playersMin.toString(),
      ),
      decoration: InputDecoration(
        hintText: 'Мин. игроков',
      ),
      style: TextStyle(fontSize: 18.0),
      onChanged: (String value) {
        var number = int.parse(value);
        if (number > 0 && number < playersMax) {
          setState(() {
            playersMin = number;
          });
        }
      },
    );
  }

  Widget buildMaxFiled() {
    return TextField(
      controller: TextEditingController(
        text: playersMax.toString(),
      ),
      decoration: InputDecoration(
        hintText: 'Макс. игроков',
      ),
      style: TextStyle(fontSize: 18.0),
      onChanged: (String value) {
        var number = int.parse(value);
        if (number <= 30 && number > playersMin) {
          setState(() {
            playersMax = number;
          });
        }
      },
    );
  }

  Widget buildNumber(number) {
    MaterialColor color;
    if (bestNumber.contains(number)) {
      color = Colors.green;
    } else if (recNumber.contains(number)) {
      color = Colors.yellow;
    } else {
      color = Colors.red;
    }
    return GestureDetector(
      onTap: () {
        toggleNumber(number);
      },
      child: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          border: Border.all(color: color[400], width: 3),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          color: color[200],
        ),
        child: Center(
          child: Text(
            '$number',
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }

  void toggleNumber(int number) {
    if (bestNumber.contains(number)) {
      bestNumber.remove(number);
    } else if (recNumber.contains(number)) {
      recNumber.remove(number);
      bestNumber.add(number);
    } else {
      recNumber.add(number);
    }
    setState(() {});
  }
}
