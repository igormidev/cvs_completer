import 'package:flutter/material.dart';

class ChooseTwoMode extends StatelessWidget {
  final int selectedIndex;
  final String textOne;
  final String textTwo;
  final String textThree;
  final void Function() oneOnTap;
  final void Function() twoOnTap;
  final void Function() threeOnTap;
  const ChooseTwoMode({
    super.key,
    required this.selectedIndex,
    required this.textOne,
    required this.textTwo,
    required this.oneOnTap,
    required this.twoOnTap,
    required this.textThree,
    required this.threeOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ChooseChipWidget(
          isSelected: selectedIndex == 0,
          text: textOne,
          onTap: oneOnTap,
        ),
        const SizedBox(width: 10),
        ChooseChipWidget(
          isSelected: selectedIndex == 1,
          text: textTwo,
          onTap: twoOnTap,
        ),
        const SizedBox(width: 10),
        ChooseChipWidget(
          isSelected: selectedIndex == 2,
          text: textThree,
          onTap: threeOnTap,
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
