import 'package:flutter/material.dart';

import '../../../widgets/bottom_nav.dart';
import 'widgets/acctmain.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        AcctMain(),
        BottomNavBar(),
      ]),
    );
  }
}
