import 'package:flutter/material.dart';

class CountryCases extends StatelessWidget {
  const CountryCases(
      {required this.Count, required this.title, required this.url});

  final String Count;
  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 40.0,
      width: double.infinity,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
            child: Image(
              image: NetworkImage(
                '$url',
              ),
              width: 40.0,
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            '$title',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            'Total cases : $Count',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
