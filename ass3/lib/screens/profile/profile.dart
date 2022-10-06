import 'package:ass3/screens/home/widgets/header.dart';
import 'package:ass3/screens/profile/widgets/profiledets.dart';
import 'package:flutter/material.dart';

import '../../widgets/bottom_nav.dart';
import 'widgets/profileheader.dart';

class HarperProfile extends StatelessWidget {
  const HarperProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileHeader(),
          ProfileDets(),
          BottomNavBar(),
        ],
      ),
    );
  }
}
