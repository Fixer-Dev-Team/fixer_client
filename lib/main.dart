import 'package:fixer_client/screens/splash.dart';
import 'package:fixer_client/util/color.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fixer Client',
      theme: ThemeData(
        primaryColor: fixerBlue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SplashScreen(),
    );
  }
}
