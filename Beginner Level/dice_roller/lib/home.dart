import 'dart:math';

import 'package:dice_roller/dice.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int diceCount = 1;
  List<int> whichDice = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  int sum=0;

  void rollDice() {
    sum=0;
    setState(() {
      for (int i = 0; i <= diceCount - 1; i++) {
        whichDice[i] = Random().nextInt(5) + 1;
        sum+=whichDice[i];
      }
    });
  }

  void addDice() {
    setState(() {
      if (diceCount == 9) {
      } else {
        diceCount++;
      }
    });
  }

  void removeDice() {
    setState(() {
      sum-=whichDice[diceCount-1];
      whichDice[diceCount-1]=0;
      if (diceCount == 1) {
      } else {
        diceCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          "Dice Roller",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.deepPurple, Colors.purple])),
        child: Column(
          children: [
            Container(
              width: 200,
              alignment: Alignment.center,
              child: Text(sum.toString()),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.green, width: 3)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Dice(whichDice: whichDice[0]),
                diceCount > 1 ? Dice(whichDice: whichDice[1]) : SizedBox(),
                diceCount > 2 ? Dice(whichDice: whichDice[2]) : SizedBox(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                diceCount > 3 ? Dice(whichDice: whichDice[3]) : SizedBox(),
                diceCount > 4 ? Dice(whichDice: whichDice[4]) : SizedBox(),
                diceCount > 5 ? Dice(whichDice: whichDice[5]) : SizedBox(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                diceCount > 6 ? Dice(whichDice: whichDice[6]) : SizedBox(),
                diceCount > 7 ? Dice(whichDice: whichDice[7]) : SizedBox(),
                diceCount > 8 ? Dice(whichDice: whichDice[8]) : SizedBox(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: rollDice,
                      child: Text(diceCount > 1 ? "Roll Dices" : "Roll Dice")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: addDice, child: Text("Add Dice")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: removeDice, child: Text("Remove Dice")),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
