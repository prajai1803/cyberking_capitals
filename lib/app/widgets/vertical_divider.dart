import 'package:flutter/material.dart';

class DottedVerticalLine extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  const DottedVerticalLine({super.key, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.0,
      height: double.infinity,
      margin: margin,
      child: CustomPaint(
        painter: DottedLinePainter(),
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    const double dashWidth = 5;
    const double dashSpace = 3;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(
          Offset(size.width / 2, startY),
          Offset(
              size.width / 2,
              startY + dashWidth < size.height
                  ? startY + dashWidth
                  : size.height),
          paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
