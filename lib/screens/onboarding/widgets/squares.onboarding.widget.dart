import 'dart:math';

import 'package:daily_notes/constants/color.constants.dart';
import 'package:flutter/material.dart';

class Squares extends StatelessWidget {
  const Squares({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      right: size.width * .5 - 156,
      top: size.height * .15 + 40,
      child: Transform.rotate(
        angle: 45 * (pi / 180),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const SizedBox(
              height: 80,
              width: 80,
            ),
            Positioned(
              right: 1,
              top: 1,
              child: Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: DNColors.greenBlue.withOpacity(.25),
                ),
              ),
            ),
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: DNColors.greenBlue.withOpacity(.5),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: DNColors.greenBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
