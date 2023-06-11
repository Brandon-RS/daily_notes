import 'package:daily_notes/constants/color.constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SquaresWithIcon extends StatelessWidget {
  const SquaresWithIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      right: size.width * .5 - 150,
      top: size.height * .15 + 248,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 76,
            width: 76,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  DNColors.purpleLight.withOpacity(.2),
                  DNColors.purple.withOpacity(.2),
                ],
              ),
            ),
          ),
          Container(
            height: 63,
            width: 63,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  DNColors.purpleLight.withOpacity(.55),
                  DNColors.purple.withOpacity(.55),
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  DNColors.purpleLight,
                  DNColors.purple,
                ],
              ),
            ),
          ),
          SvgPicture.asset(
            'assets/svg/pen-edit-line.svg',
          ),
        ],
      ),
    );
  }
}
