import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:flutter/material.dart';

class RoundedTabIndicator extends Decoration {
  final double radius;
  final Color color;
  final double indicatorHeight;
  final double height;

  const RoundedTabIndicator({
    required this.height,
    this.radius = 8,
    this.indicatorHeight = 4,
    this.color = AppColors.secondary,
  });

  @override
  CustomPainter createBoxPainter([VoidCallback? onChanged]) {
    return CustomPainter(
        this, onChanged, radius, color, indicatorHeight, height);
  }
}

class CustomPainter extends BoxPainter {
  final RoundedTabIndicator decoration;
  final double radius;
  final double height;
  final Color color;
  final double indicatorHeight;

  CustomPainter(
    this.decoration,
    VoidCallback? onChanged,
    this.radius,
    this.color,
    this.indicatorHeight,
    this.height,
  ) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    final Paint paint = Paint();
    double xAxisPos = offset.dx + configuration.size!.width / 2;
    double yAxisPos =
        offset.dy + configuration.size!.height - indicatorHeight / 2;
    paint.color = color;

    RRect fullRect = RRect.fromRectAndCorners(
      Rect.fromCenter(
        center: Offset(xAxisPos, yAxisPos - height),
        width: configuration.size!.width / 2.5,
        height: indicatorHeight,
      ),
      bottomLeft: Radius.circular(radius),
      bottomRight: Radius.circular(radius),
    );

    canvas.drawRRect(fullRect, paint);
  }
}
