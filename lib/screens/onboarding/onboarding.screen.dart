import 'package:daily_notes/constants/color.constants.dart';
import 'package:daily_notes/screens/onboarding/widgets/onboarding.widgets.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: DNColors.mainGradient,
          ),
        ),
        child: Stack(
          children: [
            const OnboardingContent(),
            const Squares(),
            const Circles(),
            const NoteSquare(),
            const SquaresWithIcon(),
            const Mon(),
            ...Mon.dost(size: size),
          ],
        ),
      ),
    );
  }
}
