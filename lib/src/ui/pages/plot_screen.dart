import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';

class PlotPage extends StatefulWidget {
  @override
  _PlotPageState createState() => _PlotPageState();
}

class _PlotPageState extends State<PlotPage>
    with SingleTickerProviderStateMixin {
  bool showDots = false, showPath = true;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _controller.value = 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            CustomAppBar(title: 'The Spiral'),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                print('${_controller.value}');
                return Expanded(
                  child: Center(
                    child: CustomPaint(
                      painter: PlotPagePainter(
                        progress: _controller.value,
                        showPath: showPath,
                        showDots: showDots,
                      ),
                    ),
                  ),
                );
              },
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 0.0),
                  child: Text('Show Dots'),
                ),
                Switch(
                  value: showDots,
                  onChanged: (value) {
                    setState(() {
                      showDots = value;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 0.0),
                  child: Text('Show Path'),
                ),
                Switch(
                  value: showPath,
                  onChanged: (value) {
                    setState(() {
                      showPath = value;
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text('Progress'),
            ),
            Slider(
              value: _controller.value,
              min: 0.0,
              max: 1.0,
              onChanged: (value) {
                setState(() {
                  _controller.value = value;
                });
              },
            ),
            Center(
              child: RaisedButton(
                onPressed: () {
                  _controller.reset();
                  _controller.forward();
                },
                child: Text('Animate'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class PlotPagePainter extends CustomPainter {
  PlotPagePainter({
    this.progress,
    this.showPath,
    this.showDots,
  });

  final double progress;
  bool showDots, showPath;

  Paint _paint = Paint()
    ..color = Colors.deepPurple
    ..strokeWidth = 4.0
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = createPlotPagePath(size);
    PathMetric pathMetric = path.computeMetrics().first;
    Path extractPath =
        pathMetric.extractPath(0.0, pathMetric.length * progress);
    if (showPath) {
      canvas.drawPath(extractPath, _paint);
    }
    if (showDots) {
      try {
        var metric = extractPath.computeMetrics().first;
        final offset = metric.getTangentForOffset(metric.length).position;
        canvas.drawCircle(offset, 8.0, Paint());
      } catch (e) {}
    }
  }

  Path createPlotPagePath(Size size) {
    double n, radius = 0, angle = 0;
    Path path = Path();
    for (n = 0; n < 20; n += 0.05) {
      radius = 1.618013 * math.exp(0.30635 * n);
      angle = n;
      var x = radius * math.cos(angle);
      var y = radius * math.sin(angle);
      path.lineTo(x, y);
    }
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
