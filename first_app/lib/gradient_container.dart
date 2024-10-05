import 'package:first_app/roll_dice.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final List<Color> color;
  const GradientContainer({super.key, required this.color});
//const GradientContainer({key}) : super(key: key); //second choice

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: color,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Center(
          child: RollDice(),
        ));
  }
}
