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
    tabBarTheme: TabBarTheme(
      dividerColor: Colors.transparent,
      indicator: UnderlineTabIndicator(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 3.0, color: DNDark.yellow),
        insets: const EdgeInsets.symmetric(horizontal: -12.0),
      ),
      labelColor: DNDark.yellow,
      labelStyle: const TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        fontSize: 15,
      ),
      unselectedLabelStyle: const TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        fontSize: 15,
      ),
      unselectedLabelColor: DNDark.grey,
    ),
    useMaterial3: true,
  );
}
