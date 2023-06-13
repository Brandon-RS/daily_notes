import 'package:daily_notes/constants/color.constants.dart';
import 'package:flutter/material.dart';

ThemeData dnPurpleDark() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: DNDark.purple,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.white,
        fontSize: 30,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.white,
        fontSize: 20,
      ),
      bodySmall: TextStyle(fontFamily: 'Montserrat', color: Colors.white, fontSize: 10),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: const MaterialStatePropertyAll(
          TextStyle(fontSize: 18, fontFamily: 'Montserrat', fontWeight: FontWeight.w600),
        ),
        overlayColor: MaterialStateProperty.all(DNDark.purple.withOpacity(.15)),
        minimumSize: const MaterialStatePropertyAll(Size(0, 0)),
        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        iconColor: MaterialStatePropertyAll(DNDark.grey),
        overlayColor: MaterialStatePropertyAll(DNDark.purple.withOpacity(.15)),
        minimumSize: const MaterialStatePropertyAll(Size(0, 0)),
        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
      ),
    ),
    useMaterial3: true,
  );
}
