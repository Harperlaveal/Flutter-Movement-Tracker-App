import 'dart:math';

import 'package:flutter/material.dart';

//This class prints the weekly steps above the graph.
class Steps extends StatelessWidget {
  const Steps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Random rand = Random();
    int steps = 44663;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            'Weekly Steps:',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            steps.toString(),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
