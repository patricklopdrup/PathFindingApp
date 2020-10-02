import 'dart:math';

import 'package:flutter/material.dart';

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
