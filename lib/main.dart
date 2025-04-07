import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news/screens/login_screen.dart';
import 'package:news/screens/news_details_screen.dart';
import 'package:news/screens/register_screen.dart';
import 'package:news/screens/search_screen.dart';
import 'package:news/screens/home_screen.dart';
import 'package:news/theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      initialRoute: LoginScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SearchScreen.routeName: (context) => SearchScreen(),
        NewsDetailsScreen.routeName: (context) => NewsDetailsScreen(),
      },
    );
  }
}
