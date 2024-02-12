// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:movie_app/controller/movie_provider.dart';
import 'package:movie_app/controller/search_provider.dart';
import 'package:movie_app/view/detailpage.dart';
import 'package:movie_app/view/home.dart';
import 'package:movie_app/view/likepage.dart';
import 'package:movie_app/view/splash_screen.dart';
import 'package:movie_app/view/view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences preferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  preferences = await SharedPreferences.getInstance();
  List<String> list = preferences.getStringList("movie") ?? [];
  List<String> removeList = preferences.getStringList("movie") ?? [];
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MovieProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchProvider(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        title: "Movie Bazaar",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        themeAnimationCurve: Curves.linear,
        initialRoute: "/",
        routes: {
          "/": (context) => Splash(),
          "Home": (context) => Home(),
          "DetailPage":(context) => DetailPage(),
          "ViewMore":(context) => ViewMore(),
          "LikePage": (context) => LikePage(),
        },
      ),
    );
  }
}
