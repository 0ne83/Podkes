import 'dart:math';
import 'package:podkes/screens/home.dart';
import 'package:flutter/material.dart';
import 'launch_screen.dart';

class Podkes extends StatefulWidget {
  const Podkes({super.key});

  @override
  State<Podkes> createState() {
    return _PodkesState();
  }
}

class _PodkesState extends State<Podkes>{
  var activeScreen = "launch_screen";

  @override
  void initState() {
    super.initState();
    activeScreen = "launch_screen";
  }

  void switchScreen() {
    setState(() {
      activeScreen = "questions_screen";
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: const Color(0xff1F1D2B),
          child: activeScreen == "launch_screen" ? LaunchScreen(switchScreen) : const Home(),
        ),
      ),
    );
  }
}
