import 'package:flutter/material.dart';
import 'package:themoviedb_app/src/pages/home.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Movie DB App',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
      },

    );
  }
}