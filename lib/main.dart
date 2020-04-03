import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _loading; 
  double _progressValue;
//  String title;



  @override
  void initState() {
    super.initState();
    _loading = false;
    _progressValue = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Liniar Progressbar'),
      ),
      body: new Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: _loading ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LinearProgressIndicator(
                value: _progressValue,
              ),
              new Text('${(_progressValue * 100).round()}%'),
            ],
          ) : Text("OkFix"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _loading = !_loading;
            _updateProgress();
          });
        },
        tooltip: 'Download',
        child: Icon(Icons.cloud_download),
      ),
    );
  }

  void _updateProgress() {
    const oneSec = const Duration(seconds: 1); Timer.periodic(oneSec, (Timer t){
      setState(() {
        _progressValue +=0.2;
        if (_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          t.cancel();
          _progressValue: 0.0;
          return;
        }
      });
    });
  }
}