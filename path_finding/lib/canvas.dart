import 'package:flutter/material.dart';
import 'package:path_finding/cell.dart';
import 'package:path_finding/data.dart';

double dx, dy;
double padding = 10;
Cell cell = Cell();
int count = 0;

class MyCanvas extends StatefulWidget {
  @override
  _MyCanvasState createState() => _MyCanvasState();
}

class _MyCanvasState extends State<MyCanvas> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[700],
      padding: EdgeInsets.all(padding),
      child: LayoutBuilder(
        builder: (_, constraints) => GestureDetector(
          child: Container(
            // width and height is the same
            width: constraints.maxWidth,
            height: constraints.maxWidth,
            color: Colors.white,
            child: CustomPaint(
              painter: MyPainter(dx, dy),
            ),
          ),
          onTapDown: (details) {
            setState(() {
              dx = details.globalPosition.dx;
              dy = details.globalPosition.dy;
              //print('hej $dx, $dy');
            });
          },
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  double x, y;
  MyPainter(this.x, this.y);

  @override
  void paint(Canvas canvas, Size size) {
    double cellWidth = size.width / CellData.colValue;
    double cellHeight = size.height / CellData.rowValue;
    print("x er $x");
    print("count ${count++}");

    int cellX;
    int cellY;
    if (x != null) {
      cellX = (x - padding) ~/ cellWidth;
      // Appbar is 80 pixel
      cellY = (y - padding - 80) ~/ cellHeight;
    }
    // Making grid of cells
    for (int col = 0; col < CellData.colValue; col++) {
      for (int row = 0; row < CellData.rowValue; row++) {
        CellData.grid[col][row] = Cell(x: col, y: row);
      }
    }

    // Draw startCell
    Cell startCell = CellData.grid[0][0];
    canvas.drawRect(
        Rect.fromLTWH(0, 0, cellWidth, cellHeight), startCell.startPaint());

    // Draw endCell
    Cell endCell = CellData.grid[CellData.colValue - 1][CellData.rowValue - 1];
    canvas.drawRect(
        Rect.fromLTWH(endCell.x * cellWidth, endCell.y * cellHeight, cellWidth,
            cellHeight),
        endCell.endPaing());

    if (x != null) {
      if (CellData.addWallButtonPressed) {
        print("er her $x,$y");
        Cell temp = CellData.grid[cellX][cellY];
        temp.addWall();
        // Adding cell to global list
        CellData.cellList.add(temp);
      }
    }
    CellData.onClear = false;

    // Drawing all cells in list
    if (CellData.cellList.length > 0) {
      for (cell in CellData.cellList) {
        canvas.drawRect(
            Rect.fromLTWH(
                cell.x * cellWidth, cell.y * cellHeight, cellWidth, cellHeight),
            cell.paint());
      }
    }
    final drawGrid = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    // Draw rows
    for (int i = 0; i < CellData.rowValue; i++) {
      canvas.drawLine(Offset(0, i * cellHeight),
          Offset(size.height, i * cellHeight), drawGrid);
    }
    // Draw cols
    for (int j = 0; j < CellData.colValue; j++) {
      canvas.drawLine(Offset(j * cellWidth, 0),
          Offset(j * cellWidth, size.width), drawGrid);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
