import 'package:ass3/screens/home/widgets/header.dart';
import 'package:flutter/material.dart';

import '../../widgets/bottom_nav.dart';
import 'widgets/activity.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppHeader(),
          Activity(),
          BottomNavBar(),
        ],
      ),
    );
  }
}
