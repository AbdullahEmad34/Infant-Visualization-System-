import 'dart:math';

import 'package:flutter/material.dart';

class CircleProgress extends CustomPainter {
  double value;
  bool isTemp;

  CircleProgress(this.value, this.isTemp);

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    int maximumValue =
    isTemp ? 50 : 100; // Temp's max is 50, Humidity's max is 100

    Paint outerCircle = Paint()
      ..strokeWidth = 10
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    Paint tempArc = Paint()
      ..strokeWidth = 10
      ..color = Color(0xff5317BD)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint humidityArc = Paint()
      ..strokeWidth = 10
      ..color = Color(0xff5317BD)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 14;
    canvas.drawCircle(center, radius, outerCircle);

    double angle = 2 * pi * (value / maximumValue);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, isTemp ? tempArc : humidityArc);
  }
}