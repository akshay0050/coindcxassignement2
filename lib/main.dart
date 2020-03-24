import 'package:coindeskassignment2/first_page.dart';
import 'package:coindeskassignment2/second_page.dart';
import 'package:coindeskassignment2/style/Style.dart';
import 'package:coindeskassignment2/third_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (BuildContext contxt) => FirstPage(),
        'second': (BuildContext contxt) => SecondPage(),
        'third': (BuildContext contxt) => ThirdPage()
      },
      //home: FirstPage()
    );
  }
}

