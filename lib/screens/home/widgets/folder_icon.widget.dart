import 'package:flutter/material.dart';

class FolderIcon extends StatelessWidget {
  const FolderIcon({
    super.key,
    required this.backColor,
    required this.frontColor,
    this.height,
    this.width,
  });

  final Color backColor;
  final Color frontColor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: FittedBox(
        fit: BoxFit.contain,
        child: SizedBox(
          height: 150,
          width: 210,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: SizedBox(
                  height: 100,
                  width: 200,
                  child: CustomPaint(
                    painter: FolderBack(color: backColor),
                  ),
                ),
              ),
              Positioned(
                left: 10,
                child: SizedBox(
                  height: 150,
                  width: 200,
                  child: CustomPaint(
                    painter: FolderFront(color: frontColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FolderBack extends CustomPainter {
  const FolderBack({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    double radius = 20;

    Path path = Path()
      ..moveTo(0, radius)
      ..lineTo(size.width * .25 - radius, size.height - radius)
      ..quadraticBezierTo(
        size.width * .25 - 15,
        size.height,
        size.width * .25,
        size.height,
      )
      ..lineTo(size.width * .75, size.height)
      ..quadraticBezierTo(
        size.width * .75 + 15,
        size.height,
        size.width * .75 + radius,
        size.height - radius,
      )
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(
        size.width + 4,
        -2,
        size.width - radius,
        0,
      )
      ..lineTo(radius, 0)
      ..quadraticBezierTo(
        -4,
        -2,
        0,
        radius,
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class FolderFront extends CustomPainter {
  const FolderFront({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    double radius = 20;

    Path path = Path()
      ..moveTo(0, radius)
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
      ..lineTo(size.width, size.height * .25 + radius)
      ..quadraticBezierTo(
        size.width + 5,
        size.height * .25,
        size.width - radius,
        size.height * .25,
      )
      ..lineTo(size.width * .35, size.height * .25)
      ..lineTo(size.width * .3, radius / 2)
      ..quadraticBezierTo(
        size.width * .3 - 5,
        0,
        size.width * .3 - radius,
        0,
      )
      ..lineTo(radius / 2, 0)
      ..quadraticBezierTo(
        radius / 2 - 14,
        2,
        0,
        radius,
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
