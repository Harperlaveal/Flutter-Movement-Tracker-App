import 'package:flutter/material.dart';

import '../../home/account/widgets/acctmain.dart';

class ProfileDets extends StatelessWidget {
  const ProfileDets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: 250,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                //This was the generic circle on the profile page.
                CircleAvatar(
                  backgroundColor: Colors.white70,
                  minRadius: 60.0,
                  child: CircleAvatar(
                    radius: 70.0,
                    backgroundImage: NetworkImage(
                        'https://stock.adobe.com/nz/images/default-avatar-profile-icon-vector-social-media-user-image/346839683?prev_url=detail'),
                  ),
                ),
              ],
            ),
            Text(
              //Profile name
              'Harper Doak',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Divider(
              color: Colors.lightBlue,
            ),
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Steps done today: 10317',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    )),
              ),
            ),
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Steps done this week: 29081',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => AcctMain()));
                },
                child: Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
