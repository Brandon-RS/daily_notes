import 'dart:math';

import 'package:daily_notes/constants/color.constants.dart';
import 'package:flutter/material.dart';

class Mon extends StatelessWidget {
  const Mon({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * .05,
      left: size.width * .06,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(height: 60, width: 60),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: DNDark.orange,
              boxShadow: [
                BoxShadow(color: DNDark.orange, blurRadius: 4),
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
                  color: DNDark.mainColor,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [.1, .65],
                    colors: [DNDark.mainColor.withOpacity(0), DNDark.mainColor],
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
        top: size.height * .1 + 60,
        left: size.width * .5 - 170,
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
        top: size.height * .1 + 300,
        left: size.width * .5 - 155,
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
        top: size.height * .1,
        right: size.width * .5 - 145,
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
        top: size.height * .1 + 270,
        right: size.width * .5 - 155,
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
