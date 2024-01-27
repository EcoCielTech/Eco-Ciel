import 'package:ecociel/utils/text.dart';
import 'package:flutter/material.dart';

class GridBoxWidget extends StatelessWidget {
  final Color color;
  final Icon icon;
  final String text1;
  final String text2;
  const GridBoxWidget(
      {required this.text1,
      required this.text2,
      required this.icon,
      required this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // globe_uk
          // monetization_on
          //weight
          //flag
          icon,
          txt(text1, weight: FontWeight.bold, size: 28),
          txt(text2, weight: FontWeight.w500, size: 13),
        ],
      ),
    );
  }
}
