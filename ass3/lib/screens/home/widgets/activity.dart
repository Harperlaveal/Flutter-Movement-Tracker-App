// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pedometer/pedometer.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Activity> {
  //Stepcount stream. This is automatically reset every day.
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

//Function below calculates step using the pedometer
  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 650,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Steps taken today:',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              _steps,
              style: TextStyle(fontSize: 60),
            ),
            Divider(
              height: 100,
              thickness: 0,
              color: Colors.white,
            ),
            Text(
              'Movement Status:',
              style: TextStyle(fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              //Code below changes the icons depending the status of movement.
              child: Icon(
                _status == 'walking'
                    ? Icons.directions_walk
                    : _status == 'running'
                        ? Icons.directions_run
                        : _status == 'stopped'
                            ? Icons.accessibility_new
                            : Icons.error,
                size: 100,
              ),
            ),
            Center(
              child: Text(
                _status,
                style: _status == 'walking' ||
                        _status == 'running' ||
                        _status == 'stopped'
                    ? TextStyle(fontSize: 30)
                    : TextStyle(fontSize: 30, color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }
}
