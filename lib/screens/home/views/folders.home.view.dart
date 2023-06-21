import 'package:daily_notes/constants/color.constants.dart';
import 'package:daily_notes/screens/home/widgets/folder_icon.widget.dart';
import 'package:flutter/material.dart';

class FoldersView extends StatelessWidget {
  const FoldersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 100),
      child: Stack(
        children: [
          FolderIcon(
            backColor: DNDark.darkGrey.withOpacity(.8),
            frontColor: DNDark.darkGrey.withOpacity(.92),
            width: 260,
          ),
          Positioned(
            left: 20,
            right: 0,
            bottom: 40,
            child: Column(
              children: List.generate(
                2,
                (index) => Container(
                  margin: const EdgeInsets.only(top: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: DNDark.grey,
                  ),
                  width: 130.0,
                  height: 10.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
