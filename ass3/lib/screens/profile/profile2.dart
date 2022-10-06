import 'package:ass3/screens/profile/widgets/profiledets.dart';
import 'package:ass3/screens/profile/widgets/profiledets2.dart';
import 'package:flutter/material.dart';

import '../../widgets/bottom_nav.dart';
import 'widgets/profileheader.dart';

class SignupProfile extends StatelessWidget {
  const SignupProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileHeader(),
          ProfileDetsSignup(),
          BottomNavBar(),
        ],
      ),
    );
  }
}
