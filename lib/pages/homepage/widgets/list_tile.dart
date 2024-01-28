import 'package:ecociel/utils/text.dart';
import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  String badgeName;
  String badgeDescription;
  Color color;
  String imageAsset;
  ListTileWidget(
      {required this.badgeDescription,
      required this.imageAsset,
      required this.badgeName,
      required this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      padding: const EdgeInsets.all(15),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageAsset),
                fit: BoxFit.fitHeight,
              ),
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 240,
                child: txt(
                  badgeName,
                  size: 18,
                  weight: FontWeight.w500,
                  maxLine: 1,
                ),
              ),
              Container(
                width: 240,
                child: txt(
                  maxLine: 2,
                  textAlign: TextAlign.start,
                  badgeDescription,
                  size: 14,
                  weight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.more_vert,
            size: 25,
          ),
        ],
      ),
    );
  }
}
