import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  List<Widget> people = [];

  List<Widget> _buildList() {
    for (var i = 0; i < 5; i++) {
      people.add(
          Draggable(
            axis: Axis.horizontal,
            feedback: Container(
              margin: EdgeInsets.all(7),
              width: 400,
              height: 630,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
            ),
            child: Container(
              margin: EdgeInsets.all(7),
              width: 400,
              height: 630,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
            ),
            childWhenDragging: Container(),
            onDragEnd: (drag) {
              if(drag.offset.direction > 2) {
                print('esquerda');
              } else if (drag.offset.direction < 1) {
                print('direita');
              }
            },
          )
      );
    }

    return people;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.account_circle,
            color: Colors.grey,
            size: 34,
          ),
          onPressed: () => print('Dale'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.textsms,
              color: Colors.grey,
              size: 34,
            ),
            onPressed: () => print('a'),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          child: Center(
            child: Column(
              children: <Widget>[
                Stack(children: _buildList()),
                Row()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
