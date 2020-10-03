import 'package:flutter/material.dart';
import 'package:path_finding/cell.dart';

int rows = 15;
int cols = 10;
double dx, dy = -1;
double padding = 10;
Cell cell = Cell();
List<Cell> cellList = List();

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
              print('hej $dx, $dy');
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

  // Generate 2d list
  List grid = List.generate(cols, (index) => List(rows));

  @override
  void paint(Canvas canvas, Size size) {
    print("hello");
    double cellWidth = size.width / cols;
    double cellHeight = size.height / rows;

    int cellX = (x - padding) ~/ cellWidth;
    // Appbar is 80 pixel
    int cellY = (y - padding - 80) ~/ cellHeight;

    // Making grid of cells
    for (int col = 0; col < cols; col++) {
      for (int row = 0; row < rows; row++) {
        grid[col][row] = Cell(x: col, y: row);
      }
    }

    // Draw startCell
    Cell startCell = grid[0][0];
    canvas.drawRect(
        Rect.fromLTWH(0, 0, cellWidth, cellHeight), startCell.startPaint());

    // Draw endCell
    Cell endCell = grid[cols - 1][rows - 1];
    canvas.drawRect(
        Rect.fromLTWH(endCell.x * cellWidth, endCell.y * cellHeight, cellWidth, cellHeight), endCell.endPaing());


    Cell temp = grid[cellX][cellY];
    print(temp);
    // Adding cell to global list
    cellList.add(temp);

    // Drawing all cells in list
    if (cellList.length > 0) {
      for (cell in cellList) {
        print('$cell');
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
    for (int i = 0; i < rows; i++) {
      canvas.drawLine(Offset(0, i * cellHeight),
          Offset(size.height, i * cellHeight), drawGrid);
    }
    // Draw cols
    for (int j = 0; j < cols; j++) {
      canvas.drawLine(Offset(j * cellWidth, 0),
          Offset(j * cellWidth, size.width), drawGrid);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
