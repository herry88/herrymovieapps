import 'package:flutter/material.dart';
import 'package:herrymovieapps/ui/movie_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new MovieList(),
    );
  }
}
