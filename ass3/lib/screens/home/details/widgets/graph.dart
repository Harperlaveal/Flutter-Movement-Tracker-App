import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Graph extends StatelessWidget {
  const Graph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Graph area fills out rest of details page.
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: GraphArea(),
      ),
    );
  }
}

class GraphArea extends StatefulWidget {
  const GraphArea({Key? key}) : super(key: key);

  @override
  _GraphAreaState createState() => _GraphAreaState();
}

class _GraphAreaState extends State<GraphArea>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

//List of data used
  List<DataPoint> data = [
    DataPoint(day: 1, steps: 1200),
    DataPoint(day: 2, steps: 8000),
    DataPoint(day: 3, steps: 2450),
    DataPoint(day: 4, steps: 11020),
    DataPoint(day: 5, steps: 7540),
    DataPoint(day: 6, steps: 9000),
    DataPoint(day: 7, steps: 3453),
    DataPoint(day: 8, steps: 2000),
  ];

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //This gesture detector would trigger the animation everytime the graph was pressed.
    return GestureDetector(
      onTap: () {
        _animationController.forward(from: 0.0);
      },
      child: CustomPaint(
          painter: GraphPainter(_animationController.view, data: data)),
    );
  }
}

//This class is utilised to draw the graph.
class GraphPainter extends CustomPainter {
  final List<DataPoint> data;
  final Animation<double> _size;

  GraphPainter(Animation<double> animation, {required this.data})
      : _size = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
            parent: animation, curve: Curves.easeInOutCubicEmphasized)),
        super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    //Variable to work out the spacing on x-axis.
    var xSpacing = size.width / (data.length - 1);
    var maxSteps = data
        .fold<DataPoint>(data[0], (p, c) => p.steps > c.steps ? p : c)
        .steps;
    var yRatio = size.height / maxSteps;
    var curveOffset = xSpacing * 0.3;
    //List of offsets
    List<Offset> offsets = [];
    var cx = 0.0;
    for (int i = 0; i < data.length; i++) {
      var y = size.height - (data[i].steps * yRatio * _size.value);
      offsets.add(Offset(cx, y));
      cx += xSpacing;
    }
    Paint linePaint = Paint()
      ..color = Colors.lightBlue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    Paint fillPaint = Paint()
      ..shader =
          ui.Gradient.linear(Offset(0, 0), Offset(size.width, size.height), [
        Colors.lightBlue,
        Colors.white,
      ])
      ..color = Colors.lightBlue
      ..style = PaintingStyle.fill;
    //Painting the outline of the dot.
    Paint dotOutlinePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 8;
    //Painting the center of the dot.
    Paint dotCenter = Paint()
      ..color = Colors.red
      ..strokeWidth = 8;

    Path linePath = Path();

    Offset cOffset = offsets[0];
    //Calculating the specifc line path from the offsets list.
    linePath.moveTo(cOffset.dx, cOffset.dy);
    for (int i = 1; i < offsets.length; i++) {
      var x = offsets[i].dx;
      var y = offsets[i].dy;
      var c1x = cOffset.dx + curveOffset;
      var c1y = cOffset.dy;
      var c2x = x - curveOffset;
      var c2y = y;
      linePath.cubicTo(c1x, c1y, c2x, c2y, x, y);
      cOffset = offsets[i];
    }

    Path fillPath = Path.from(linePath);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);
    //Drawing the path on the Canvas
    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(linePath, linePaint);
    //Drawing the circle on the Canvas which is on the line.
    canvas.drawCircle(offsets[4], 10, dotOutlinePaint);
    canvas.drawCircle(offsets[4], 10, dotCenter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//Intialising the DataPoint class.
class DataPoint {
  final int day;
  final int steps;

  DataPoint({
    required this.day,
    required this.steps,
  });
}
