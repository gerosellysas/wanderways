import 'package:flutter/material.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

class HomeViewPaint extends CustomPainter {
  const HomeViewPaint();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPaint(Paint()..color = Hues.greyLightest);

    Path bezierPath = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height * 0.35)
      ..quadraticBezierTo(
        size.width / 2,
        size.height * 0.2,
        size.width,
        size.height * 0.35,
      )
      ..lineTo(size.width, 0);

    final bezierPaint = Paint()..color = Hues.primary;

    canvas.drawPath(bezierPath, bezierPaint);
  }

  @override
  bool shouldRepaint(HomeViewPaint oldDelegate) => false;
}
