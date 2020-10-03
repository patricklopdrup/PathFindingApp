import 'package:flutter/material.dart';

class CanvasControl extends StatefulWidget {
  @override
  _CanvasControlState createState() => _CanvasControlState();
}

class _CanvasControlState extends State<CanvasControl> {
  bool wallButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Add wall button
          Expanded(
            child: MaterialButton(
              onPressed: () {
                setState(() {
                  wallButtonPressed = !wallButtonPressed;
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
              color: wallButtonPressed ? Colors.amber : Colors.white,
              shape: Border.all(color: Colors.black),
            ),
          ),
          SizedBox(width: 10),
          // Auto place walls
          Expanded(
            child: MaterialButton(
              onPressed: () {
                setState(() {
                  wallButtonPressed = !wallButtonPressed;
                });
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
                  wallButtonPressed = !wallButtonPressed;
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
    );
  }
}
