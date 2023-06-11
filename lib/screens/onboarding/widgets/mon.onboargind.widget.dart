import 'dart:math';

import 'package:daily_notes/constants/color.constants.dart';
import 'package:flutter/material.dart';

class Mon extends StatelessWidget {
  const Mon({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * .1,
      left: 10,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(height: 60, width: 60),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: DNColors.orange,
              boxShadow: [
                BoxShadow(color: DNColors.orange, blurRadius: 4),
              ],
            ),
          ),
          Positioned(
            top: -8,
            child: Transform.rotate(
              angle: 310 * (pi / 180),
              child: Container(
                height: 70,
                width: 55,
                decoration: BoxDecoration(
                  color: DNColors.mainColor,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [.1, .65],
                    colors: [DNColors.mainColor.withOpacity(0), DNColors.mainColor],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static List<Widget> dost({required Size size}) {
    return [
      Positioned(
        top: size.height * .15 + 100,
        left: 25,
        child: Container(
          height: 6,
          width: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(color: Colors.white, blurRadius: 4),
            ],
          ),
        ),
      ),
      Positioned(
        top: size.height * .15 + 320,
        left: 42,
        child: Container(
          height: 6,
          width: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(color: Colors.white, blurRadius: 4),
            ],
          ),
        ),
      ),
      Positioned(
        top: size.height * .15,
        right: 40,
        child: Container(
          height: 6,
          width: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(color: Colors.white, blurRadius: 4),
            ],
          ),
        ),
      ),
      Positioned(
        top: size.height * .15 + 290,
        right: 20,
        child: Container(
          height: 6,
          width: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(color: Colors.white, blurRadius: 4),
            ],
          ),
        ),
      ),
    ];
  }
}
