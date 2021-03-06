import 'package:flutter/material.dart';
import 'package:path_finding/canvas.dart';
import 'package:path_finding/canvasControl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Path finding',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Path finding'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          MyCanvas(),
          CanvasControl(),
        ],
      ),
    );
  }
}
