import 'package:flutter/material.dart';
import 'package:path_finding/data.dart';

class CanvasControl extends StatefulWidget {
  @override
  _CanvasControlState createState() => _CanvasControlState();
}

class _CanvasControlState extends State<CanvasControl> {
  bool addWallButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add wall button
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      addWallButtonPressed = !addWallButtonPressed;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      children: [
                        Icon(Icons.add_box),
                        Text('Add Walls'),
                      ],
                    ),
                  ),
                  color: addWallButtonPressed ? Colors.amber : Colors.white,
                  shape: Border.all(color: Colors.black),
                ),
              ),
              SizedBox(width: 10),
              // Auto place walls
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      children: [
                        Icon(Icons.apps),
                        Text('Auto Walls'),
                      ],
                    ),
                  ),
                  shape: Border.all(color: Colors.black),
                ),
              ),
              SizedBox(width: 10),
              // Clear walls
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      clearWalls();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      children: [
                        Icon(Icons.clear),
                        Text('Clear Walls'),
                      ],
                    ),
                  ),
                  shape: Border.all(color: Colors.black),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Column slider
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Columns: ${CellData.colValue}',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Slider.adaptive(
                value: CellData.colValue.toDouble(),
                onChanged: (newValue) {
                  setState(() => CellData.colValue = newValue.round());
                },
                min: 0,
                max: 50,
                divisions: 50,
                label: "${CellData.colValue}",
              ),
            ],
          ),
          // Row slider
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Rows: ${CellData.rowValue}',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Slider.adaptive(
                value: CellData.rowValue.toDouble(),
                onChanged: (newValue) {
                  setState(() => CellData.rowValue = newValue.round());
                },
                min: 0,
                max: CellData.maxValue.toDouble(),
                divisions: CellData.maxValue,
                label: "${CellData.rowValue}",
              ),
            ],
          ),
        ],
      ),
    );
  }

  void clearWalls() {
    CellData.cellList.clear();
    CellData.onClear = true;
  }
}
