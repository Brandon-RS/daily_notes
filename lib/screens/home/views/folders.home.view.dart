import 'package:daily_notes/constants/color.constants.dart';
import 'package:daily_notes/screens/home/widgets/folder_icon.widget.dart';
import 'package:flutter/material.dart';

class FoldersView extends StatelessWidget {
  const FoldersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FolderIcon(
          backColor: DNDark.darkYellow,
          frontColor: DNDark.yellow,
        ),
      ],
    );
  }
}
