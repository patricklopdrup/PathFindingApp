import 'dart:math';
import 'package:flutter/material.dart';
import 'package:path_finding/data.dart';

class Cell {
  int x, y;
  int fVal, gVal, hVal;
  double pctForWall = 50.0;
  bool isWall;
  bool isGenerated = false;

  // Constructor taking x- and y coordinates
  Cell({this.x, this.y});

  Paint paint() {
    if (!this.isGenerated) {
      this.isGenerated = true;
      return _generateSquare();
    } else {
      return this.isWall ? _wallPaint() : _normPaint();
    }
  }

  Paint _generateSquare() {
    if (_calcIfWall(pctForWall)) {
      this.isWall = true;
      return _wallPaint();
    } else {
      this.isWall = false;
      return _normPaint();
    }
  }

  void autoWall() {
    if (_calcIfWall(pctForWall)) {
      addWall();
    }
  }

  void addWall() {
    this.isWall = true;
    this.isGenerated = true;
    CellData.cellList.add(this);
  }

  bool _calcIfWall(double pctForWall) {
    var rng = Random();
    return rng.nextDouble() < (pctForWall / 100) ? true : false;
  }

  Paint _clearPaint() {
    return Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
  }

  Paint _normPaint() {
    return Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.fill;
  }

  Paint _wallPaint() {
    return Paint()
      ..color = Colors.grey[700]
      ..style = PaintingStyle.fill;
  }

  Paint startPaint() {
    return Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;
  }

  Paint endPaing() {
    return Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
  }

  @override
  String toString() {
    // TODO: implement toString
    return '$x,$y - wall: $isWall';
  }
}
