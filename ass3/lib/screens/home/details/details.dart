import 'package:flutter/material.dart';

import '../../../widgets/bottom_nav.dart';
import 'widgets/Info.dart';
import 'widgets/dates.dart';
import 'widgets/graph.dart';
import 'widgets/stats.dart';
import 'widgets/steps.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Dates(),
        Steps(),
        Graph(),
        Info(),
        Stats(),
        BottomNavBar(),
      ]),
    );
  }
}
