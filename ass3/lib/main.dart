import 'package:ass3/screens/home/details/details.dart';
import 'package:ass3/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/home/account/account.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movement Tracker',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/details': (context) => DetailsPage(), //Setting page
        '/account': (context) => Account(),
      },
      initialRoute: '/',
    );
  }
}
