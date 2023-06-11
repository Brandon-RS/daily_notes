import 'package:daily_notes/constants/color.constants.dart';
import 'package:daily_notes/screens/onboarding/widgets/content.onboarding.widget.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: DNColors.mainGradient,
          ),
        ),
        child: const Stack(
          children: [
            OnboardingContent(),
          ],
        ),
      ),
    );
  }
}
