import 'package:flutter/material.dart';

class WorldCasePanel extends StatelessWidget {
  const WorldCasePanel(
      {required this.panelColor,
      required this.textColor,
      required this.title,
      required this.count});

  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 80,
      width: MediaQuery.of(context).size.width / 2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$title',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: textColor,
            ),
          ),
          Text(
            '$count',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
