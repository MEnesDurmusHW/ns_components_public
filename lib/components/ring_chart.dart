part of '../ns_components.dart';

class NSRingChart extends StatelessWidget {
  final List<NSRingChartData> data;
  final double ringRadius;
  final double strokeWidth;

  const NSRingChart({
    super.key,
    required this.data,
    required this.ringRadius,
    required this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(ringRadius),
      child: Stack(
        children: [
          CustomPaint(
            painter: RingChartPainter(
              [
                const NSRingChartData(360, CupertinoColors.systemGrey6),
              ],
              ringRadius,
              strokeWidth,
            ),
          ),
          CustomPaint(
            painter: RingChartPainter(
              data,
              ringRadius,
              strokeWidth,
            ),
          ),
        ],
      ),
    );
  }
}

class RingChartPainter extends CustomPainter {
  final List<NSRingChartData> data;
  final double ringRadius;
  final double strokeWidth;

  RingChartPainter(this.data, this.ringRadius, this.strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    double startAngle = -0.25;

    for (var i = 0; i < data.length; i++) {
      var value = data[i].value;
      var color = data[i].color;

      paint.color = color ?? navigator.context.theme.primaryColor;

      canvas.drawArc(
        Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: ringRadius),
        radians(startAngle),
        radians(value),
        false,
        paint,
      );

      startAngle += value;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  double radians(double degrees) {
    return (degrees * 360) * (pi / 180);
  }
}

class NSRingChartData {
  final double value;
  final Color? color;

  const NSRingChartData(this.value, [this.color]);
}
