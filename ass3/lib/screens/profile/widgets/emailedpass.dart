import 'package:flutter/material.dart';

import '../../home/account/widgets/acctmain.dart';

class EmailedPass extends StatelessWidget {
  const EmailedPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text("Forgot Password"),
              automaticallyImplyLeading: false,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child:
                        Text('Password reset link has been sent to your email',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => AcctMain()));
                      },
                      child: Text(
                        'Login Screen',
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
