import 'package:flutter/material.dart';
import 'package:app_1/dice_roler.dart';

var beginAlignment = Alignment.topLeft;
// AlignmentGeometry? beginAlignment;
//  const beginAlignment = Alignment.topLeft;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key});
  // GradientContainer({key}): super(key: key);

  const GradientContainer.purple({super.key})
      : color1 = Colors.purple,
        color2 = Colors.indigo;

  final Color color1;
  final Color color2;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: beginAlignment,
          end: Alignment.bottomRight,
        ),
      ),

      // child: const Center(child: StyledText("chocolat")),
      child: Center(
        child: DiceRoller()
      ),
    );
  }
}
