import 'package:flutter/material.dart';

class FlowExample extends StatelessWidget {
  const FlowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text('Flow Example App Bar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Flow(
          delegate:
              _FlowDelegate(), // Custom delegate for positioning the children
          children: <Widget>[
            _buildContainer(Colors.red, '1st', 100, 100),
            _buildContainer(Colors.green, '2nd', 230, 230),
            _buildContainer(Colors.blue, '3rd', 200, 100),
            _buildContainer(Colors.yellow, '4th', 300, 100),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(
      Color color, String label, double width, double height) {
    return Container(
      width: width,
      height: height,
      color: color,
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _FlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    // Position the children based on the available space
    var x = 0.0;
    var y = 0.0;
    for (var i = 0; i < context.childCount; i++) {
      var childSize = context.getChildSize(i);
      // Check if the current child can fit horizontally
      if (x + childSize!.width > context.size.width) {
        x = 0;
        y += childSize.height;
      }
      // Position the child
      context.paintChild(
        i,
        transform: Matrix4.translationValues(x, y, 0.0),
      );
      x += childSize.width;
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) => true;
}
