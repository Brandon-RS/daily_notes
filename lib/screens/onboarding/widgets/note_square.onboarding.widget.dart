import 'dart:math';
import 'dart:ui';

import 'package:daily_notes/constants/color.constants.dart';
import 'package:flutter/material.dart';

class NoteSquare extends StatelessWidget {
  const NoteSquare({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * .1,
      left: size.width * .5 - 105,
      child: Stack(
        children: [
          const SizedBox(height: 310, width: 230),
          Positioned(
            top: 7.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  height: 270,
                  width: 210,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: DNColors.grey.withOpacity(.4),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      4,
                      (index) => Container(
                        height: 14,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: DNColors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: 210,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                5,
                (index) => SizedBox(
                  height: 16,
                  width: 16,
                  child: CustomPaint(painter: SemiRing()),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SemiRing extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..color = DNColors.grey
      ..strokeCap = StrokeCap.round;

    final roundedArc = Path()
      ..addArc(
        Rect.fromCircle(center: center, radius: radius),
        125 * (pi / 180),
        110 * (pi / 180),
      );

    final squaredArc = Path()
      ..addArc(
        Rect.fromCircle(center: center, radius: radius),
        240 * (pi / 180),
        120 * (pi / 180),
      );

    canvas.drawPath(roundedArc, paint);
    canvas.drawPath(squaredArc, paint..strokeCap = StrokeCap.butt);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
