import 'dart:async';

import 'package:path/path.dart';
//NON-IOT Component used (SQLite database)
import 'package:sqflite/sqflite.dart';

import 'package:ass3/screens/profile/widgets/forgotpass.dart';
import 'package:flutter/material.dart';

import '../../../profile/profile.dart';
import '../../../profile/widgets/signup.dart';

//Stateful because it handles the logging in and out of account.
class AcctMain extends StatefulWidget {
  @override
  _AcctMain createState() => _AcctMain();
}

class _AcctMain extends State<AcctMain> {
  @override
  Widget build(BuildContext context) {
    //Expanded fills the rest of the unused area.
    return Expanded(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Login Page"),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HarperProfile()));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ForgotPass()));
                  },
                  child: Text(
                    'Forgot Password',
                  ),
                ),
              ),
              SizedBox(
                height: 130,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => SignUp()));
                  },
                  child: Text(
                    'Create Account',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Person class for database.
class Person {
  final String email;
  final String password;

//Initialising the person class
  const Person({
    required this.email,
    required this.password,
  });

//Map to map persons
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'Person{email: $email, password: $password}';
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      openDatabase(join(await getDatabasesPath(), 'person_database.db'),
          onCreate: (db, version) {
    return db.execute(
      'CREATE TABLE persons(email TEXT, password TEXT)',
    );
  });
}

Future<void> insertPerson(Person person) async {
  var database;
  final db = await database;
  await db.insert(
    'persons',
    person.toMap(),
    ConflictAlgorithm: ConflictAlgorithm.replace,
  );
}
