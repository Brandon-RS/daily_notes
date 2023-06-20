import 'package:flutter/material.dart';

class FoldersView extends StatelessWidget {
  const FoldersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200,
        width: 340,
        child: CustomPaint(
          painter: PT(),
        ),
      ),
    );
  }
}

class PT extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    double radius = 20;

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * .2 - radius, size.height - radius)
      ..quadraticBezierTo(
        size.width * .2 - 15,
        size.height,
        size.width * .2,
        size.height,
      )
      ..lineTo(size.width * .8, size.height)
      ..quadraticBezierTo(
        size.width * .8 + 15,
        size.height,
        size.width * .8 + radius,
        size.height - radius,
      )
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
