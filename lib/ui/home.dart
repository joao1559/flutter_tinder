import 'package:flutter/material.dart';
import 'package:flutter_tinder/ui/widgets/dragging.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  List<Widget> people = [];

  @override
  void initState() {
    _buildList();
  }

  List<Widget> _buildList() {
    for (var i = 0; i < 2; i++) {
      people.add(
        Dragging(
          child: Container(
            margin: EdgeInsets.all(7),
            width: 400,
            height: 630,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://santopapo.com.br/wp-content/uploads/7-Dicas-para-conquistar-uma-mulher-especial.jpg')
              )
            ),
          ),
          callback: (teste) {
//            print(teste);
          },
          key: Key('card$i'),
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
          onPressed: () => print('profile'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.textsms,
              color: Colors.grey,
              size: 34,
            ),
            onPressed: () => print('messages'),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          child: Center(
            child: Column(
              children: <Widget>[
                Stack(children: people),
                Row()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
