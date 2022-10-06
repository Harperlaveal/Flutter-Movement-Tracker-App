import 'package:flutter/material.dart';

import '../../../../helpers.dart';

class Dates extends StatelessWidget {
  const Dates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DateBox> dateBoxes = [];

    DateTime date = DateTime.now().subtract(Duration(days: 3));
    for (int i = 0; i < 7; i++) {
      dateBoxes.add(DateBox(date: date, active: i == 3));
      date = date.add(Duration(days: 1));
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: dateBoxes,
      ),
    );
  }
}

class DateBox extends StatelessWidget {
  final bool active;
  final DateTime date;

  const DateBox({
    Key? key,
    this.active = false,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 70,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      decoration: BoxDecoration(
        gradient: active
            ? LinearGradient(colors: [
                Colors.white,
                Colors.lightBlue,
              ], begin: Alignment.topCenter)
            : null,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.lightBlue),
      ),
      child: Column(
        children: [
          Text(daysOfWeek[date.weekday]!,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              )),
          Text(date.day.toString(),
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
              )),
        ],
      ),
    );
  }
}
