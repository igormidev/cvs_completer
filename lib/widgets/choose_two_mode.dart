import 'package:flutter/material.dart';

class ChooseTwoMode extends StatelessWidget {
  final bool isOneSelected;
  final String textOne;
  final String textTwo;
  final void Function() oneOnTap;
  final void Function() twoOnTap;
  const ChooseTwoMode({
    super.key,
    required this.isOneSelected,
    required this.textOne,
    required this.textTwo,
    required this.oneOnTap,
    required this.twoOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ChooseChipWidget(
          isSelected: isOneSelected,
          text: textOne,
          onTap: oneOnTap,
        ),
        const SizedBox(width: 10),
        ChooseChipWidget(
          isSelected: !isOneSelected,
          text: textTwo,
          onTap: twoOnTap,
        ),
      ],
    );
  }
}

class ChooseChipWidget extends StatelessWidget {
  final bool isSelected;
  final String text;
  final void Function() onTap;
  const ChooseChipWidget({
    super.key,
    required this.isSelected,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.tertiary.withAlpha(100),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 15,
              color: isSelected ? Colors.white : Colors.grey[800],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
