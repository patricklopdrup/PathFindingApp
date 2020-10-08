import 'package:path_finding/cell.dart';

class CellData {
  // Amount of columns and rows in the grid
  static int colValue = 10;
  static int rowValue = 20;

  // Start max value for list size
  static int _maxValue = 50;

  // The grid as a 2d list
  //static List grid = List.generate(colValue, (index) => List(rowValue), growable: true);
  static List grid = List.generate(_maxValue, (index) => List(_maxValue), growable: true);

  // List of cell that has to be painted
  static List<Cell> cellList = List();
}