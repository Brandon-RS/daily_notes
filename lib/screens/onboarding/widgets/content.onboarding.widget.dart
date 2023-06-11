import 'package:daily_notes/constants/color.constants.dart';
import 'package:flutter/material.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      bottom: size.height * .18,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Daily Notes',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontSize: 26,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Take notes, reminders, set targets, collect resources, and secure privacy.',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontSize: 17,
                height: 2,
              ),
            ),
            const SizedBox(height: 40),
            TextButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  overlayColor: MaterialStateProperty.all<Color?>(DNColors.purple.withOpacity(0.04)),
                  backgroundColor: MaterialStateProperty.all<Color?>(DNColors.purple),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 30, vertical: 18))),
              onPressed: () {},
              child: const Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
