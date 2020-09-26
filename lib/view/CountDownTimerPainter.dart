import 'dart:math';

import 'package:flutter/cupertino.dart';

class CountDownTimerPainter extends CustomPainter {

  final Animation<double> animation;
  final Color backgroundColor, color;

  Offset endPointer;

  CountDownTimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = _getPaint(color: backgroundColor, width: 5);
    Paint endPaint = _getPaint(color: color, width: 5, style: PaintingStyle.fill);
    Paint endPaintOutter = _getPaint(color: color, width: 2);

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * pi;
    canvas.drawArc(Offset.zero & size, pi * 1.5, -progress, false, paint);

    var center = Offset(size.width / 2, size.height / 2);
    var radius = min(size.width / 2, size.height / 2);
    endPointer = radiansToCoordinates(center, percentageToRadians(-((1.0 - animation.value) * 100) - 25), radius);
    canvas.drawCircle(endPointer, 8.0, endPaint);
    canvas.drawCircle(endPointer, 12.0, endPaintOutter);
  }

  Paint _getPaint({@required Color color, double width, PaintingStyle style}) =>
      Paint()
        ..color = color
        ..strokeCap = StrokeCap.butt
        ..style = style ?? PaintingStyle.stroke
        ..strokeWidth = width;

  @override
  bool shouldRepaint(CountDownTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }

  Offset radiansToCoordinates(Offset center, double radians, double radius) {
    var dx = center.dx + radius * cos(radians);
    var dy = center.dy + radius * sin(radians);
    return Offset(dx, dy);
  }

  double percentageToRadians(double percentage) => ((2 * pi * percentage) / 100);
}