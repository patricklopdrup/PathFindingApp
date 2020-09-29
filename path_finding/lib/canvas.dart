import 'package:flutter/material.dart';
import 'dart:math';

class MyCanvas extends StatefulWidget {
  @override
  _MyCanvasState createState() => _MyCanvasState();
}

class _MyCanvasState extends State<MyCanvas> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[700],
      padding: EdgeInsets.all(20),
      child: LayoutBuilder(
        builder: (_, constraints) => Container(
          // width and height is the same
          width: constraints.maxWidth,
          height: constraints.maxWidth,
          color: Colors.white,
          child: CustomPaint(
            painter: MyPainter(),
          ),
        ),
      ),
    );
  }
}


class Cell {
  int x, y;
  int fVal, gVal, hVal;
  double pctForWall = 20.0;
  bool isWall;
  
  Paint generateSquare() {
    return calcIfWall(pctForWall) ? _wallPaint() : _normPaint();
  }

  bool calcIfWall(double pctForWall) {
    var rng = Random();
    return rng.nextDouble() < (pctForWall / 100) ? true : false;
  }

  Paint _normPaint() {
    return Paint()
    ..color = Colors.red[400]
    ..style = PaintingStyle.fill;
  }

  Paint _wallPaint() {
    return Paint()
    ..color = Colors.grey[700]
    ..style = PaintingStyle.fill;
  }

}

class MyPainter extends CustomPainter {
  int rows = 15;
  int cols = 10;
  Cell cell = Cell();
  List<List<int>> grid = [];


  @override
  void paint(Canvas canvas, Size size) {
    double myWidth = size.width / rows;
    double myHeight = size.height / cols;

    final drawGrid = Paint()
    ..color = Colors.black
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;

    // Making 2d array
    for (int i = 0; i < cols; i++) {
      grid.insert(i, List(rows));
    }
    
    // Draw rows
    for (int i = 0; i < rows; i++) {
      canvas.drawLine(Offset(0, i*myWidth), Offset(size.height, i*myWidth), drawGrid);
    }
    // Draw cols
    for (int j = 0; j < cols; j++) {
      canvas.drawLine(Offset(j*myHeight, 0), Offset(j*myHeight, size.width), drawGrid);
    }

    

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
