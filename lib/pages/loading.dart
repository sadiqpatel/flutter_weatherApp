import 'package:flutter/material.dart';

import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime worldTime = WorldTime(
        location: "Berlin", url: "Europe/Berlin", flag: "germany.png");
    await worldTime.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'location': worldTime.location,
      'daytime': worldTime.daytime,
      'time': worldTime.time
    });
  }

  @override
  State<Loading> createState() => _LoadingState();

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 40.0,
        ),
      ),
    );
  }
}
