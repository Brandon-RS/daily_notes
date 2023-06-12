import 'package:daily_notes/constants/color.constants.dart';
import 'package:daily_notes/preferences/preferences.dart';
import 'package:daily_notes/screens/onboarding/widgets/onboarding.widgets.dart';
import 'package:daily_notes/shared/widgets/title_check_box.widget.dart';
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
        child: ListView(
          children: [
            SizedBox(
              height: size.height * .15 + 275,
              child: Stack(
                children: [
                  const Squares(),
                  const Circles(),
                  const NoteSquare(),
                  const SquaresWithIcon(),
                  const Mon(),
                  ...Mon.dost(size: size),
                ],
              ),
            ),
            const OnboardingContent(),
            const SizedBox(height: 50),
            Center(
              child: TitleCheckBox(
                text: 'Do not show this page again.',
                onTap: () => Preferences.showOnboarding = !Preferences.showOnboarding,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
