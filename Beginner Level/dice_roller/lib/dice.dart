import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  final int whichDice;
  const Dice({super.key, required this.whichDice});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
          height: 110,
          width: 110,
          child: Image.asset("images/dice-$whichDice.png")),
    );
  }
}
