import 'package:daily_notes/constants/color.constants.dart';
import 'package:flutter/material.dart';

class Circles extends StatelessWidget {
  const Circles({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      left: size.width * .5 - 151,
      top: size.height * .15 + 155,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 68,
            width: 68,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  DNDark.orangeLight.withOpacity(.2),
                  DNDark.orange.withOpacity(.2),
                ],
              ),
            ),
          ),
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  DNDark.orangeLight.withOpacity(.55),
                  DNDark.orange.withOpacity(.55),
                ],
              ),
            ),
          ),
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  DNDark.orangeLight.withOpacity(.7),
                  DNDark.orange.withOpacity(.7),
                ],
              ),
            ),
          ),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  DNDark.orangeLight,
                  DNDark.orange,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
