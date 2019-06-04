import 'dart:math';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter_tinder/ui/widgets/dragging.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  List<Widget> people = [];
  int _topPicks = 0;

  @override
  void initState() {
    _buildList();
  }

  List<Widget> _buildList() {
    people.add(
      Container(
        margin: EdgeInsets.all(7),
        width: 400,
        height: 630,
        child: Center(
          child: Text('Não há pessoas perto de você :('),
        ),
      )
    );

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
            print(teste);
            setState(() {
              people.removeLast();
            });
          },
          key: Key('card$i'),
        )
      );
    }

    print('inseriu');

    return people;
  }

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
        title: Container(
          height: 45,
          width: 85,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: 40,
                width: 40,
                child: FittedBox(
                  child: FloatingActionButton(
                    child: Icon(Icons.home),
                    backgroundColor: _topPicks == 0 ? Colors.white : Colors.grey,
                    elevation: _topPicks == 0 ? 10 : 0,
                    onPressed: () {
                      setState(() {
                        _topPicks = 0;
                      });
                    },
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                child: FittedBox(
                  child: FloatingActionButton(
                    child: Icon(Icons.home),
                    backgroundColor: _topPicks == 1 ? Colors.white : Colors.grey,
                    elevation: _topPicks == 1 ? 10 : 0,
                    onPressed: () {
                      setState(() {
                        _topPicks = 1;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
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
                Stack(
                  children: people
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 742,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 55,
                        width: 55,
                        padding: EdgeInsets.only(bottom: 16),
                        child: FittedBox(
                          child: FloatingActionButton(
                            child: Icon(Icons.refresh, color: Colors.blue,),
                            backgroundColor: Colors.white,
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Container(
                        height: 65,
                        width: 65,
                        child: FittedBox(
                          child: FloatingActionButton(
                            child: Icon(Icons.close, color: Colors.red, size: 30),
                            backgroundColor: Colors.white,
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        child: FittedBox(
                          child: FloatingActionButton(
                            child: Icon(Icons.star, color: Colors.blue),
                            backgroundColor: Colors.white,
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Container(
                        height: 65,
                        width: 65,
                        child: FittedBox(
                          child: FloatingActionButton(
                            child: Icon(Icons.favorite, color: Colors.green, size: 30,),
                            backgroundColor: Colors.white,
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Container(
                        height: 55,
                        width: 55,
                        padding: EdgeInsets.only(bottom: 16),
                        child: FittedBox(
                          child: FloatingActionButton(
                            child: Icon(Icons.flash_on, color: Colors.deepPurpleAccent,),
                            backgroundColor: Colors.white,
                            onPressed: () {},
                          ),
                        )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
