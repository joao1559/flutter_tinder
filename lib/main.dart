import 'package:flutter/material.dart';
import 'package:flutter_tinder/ui/home.dart';


void main() {
  runApp(MaterialApp(
    title: 'Cópia do Tinder',
    home: Home(),
    theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.amberAccent
    )
  ));
}