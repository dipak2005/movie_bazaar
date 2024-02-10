// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, "Home");
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/box.png",
            width: MediaQuery.sizeOf(context).width * 0.7,
            height: MediaQuery.sizeOf(context).height * 0.6),
      ),
    );
  }
}
