import 'package:flutter/material.dart';
import 'package:news/screens/source_section.dart';
import 'package:news/screens/home_screen.dart';
import 'package:news/theme/dark_theme.dart';
import 'package:news/theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LightTheme.lightTheme,
      darkTheme: DarkTheme.darkTheme,
      home: HomeScreen(),

    );
  }
}

