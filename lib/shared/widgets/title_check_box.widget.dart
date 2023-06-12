import 'package:daily_notes/constants/color.constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleCheckBox extends StatelessWidget {
  const TitleCheckBox({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ValueNotifier<bool>>(
      create: (_) => ValueNotifier<bool>(false),
      child: Consumer<ValueNotifier<bool>>(
        builder: (context, notifier, child) => InkWell(
          onTap: () {
            notifier.value = !notifier.value;
            onTap();
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  border: Border.all(color: DNColors.purple),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Icon(
                  Icons.check,
                  color: notifier.value ? Colors.white : Colors.transparent,
                  size: 20,
                ),
              ),
              const SizedBox(width: 15),
              Text(
                text,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
