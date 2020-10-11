import 'package:path_finding/cell.dart';

class CellData {
  // Amount of columns and rows in the grid
  static int colValue = 10;
  static int rowValue = 20;

  // Start max value for list size
  static int maxValue = 50;

  static bool onClear;

  // The grid as a 2d list
  //static List grid = List.generate(colValue, (index) => List(rowValue), growable: true);
  static List grid =
      List.generate(maxValue, (index) => List(maxValue), growable: true);

  // List of cell that has to be painted
  static List<Cell> cellList = List();
}
