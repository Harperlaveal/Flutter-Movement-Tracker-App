import 'package:flutter/material.dart';

import '../../../../helpers.dart';

//This class was used for getting the date boxes printing at the top of the graph.
class Dates extends StatelessWidget {
  const Dates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DateBox> dateBoxes = [];

    DateTime date = DateTime.now().subtract(Duration(days: 3));
    //Loop to print all 7 dates boxes for 7 days of the week.
    for (int i = 0; i < 7; i++) {
      dateBoxes.add(DateBox(date: date, active: i == 3));
      date = date.add(Duration(days: 1));
    }
    //Set a specifc padding for each DateBox
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
  //Active bool is too ensure that the current day is highlighted blue.
  final bool active;
  final DateTime date;

  const DateBox({
    Key? key,
    this.active = false,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Below is the container and the style of what is inside the DateBoxes.
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
