import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 80,
        color: Colors.white,
        child: IconTheme(
          data: IconThemeData(color: Colors.black),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/account');
                },
                child: Icon(Icons.account_circle),
              ),
              Icon(Icons.search),
              Transform.translate(
                offset: Offset(0, -12),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                  child: Container(
                      padding: const EdgeInsets.all(13),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            colors: [Color(0xff92e2ff), Color(0xff1ebdf8)],
                          )),
                      child: Icon(Icons.home)),
                ),
              ),
              Icon(Icons.date_range),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/details');
                  },
                  child: Icon(Icons.settings)),
            ],
          ),
        ));
  }
}
