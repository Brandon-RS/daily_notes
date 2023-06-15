import 'dart:io';

import 'package:daily_notes/constants/color.constants.dart';
import 'package:daily_notes/screens/home/widgets/home.widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: DNDark.mainGradient),
        ),
        child: SafeArea(
          child: Column(
            children: [
              if (Platform.isAndroid) const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Notes',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          ),
                        ),
                        child: Text(
                          'Edit',
                          style: TextStyle(color: DNDark.grey),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search, size: 28),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz),
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: DNDark.grey),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const Tabs(),
            ],
          ),
        ),
      ),
    );
  }
}
