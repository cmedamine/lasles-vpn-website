import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Rubik',
        buttonTheme: const ButtonThemeData(),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            splashFactory: NoSplash.splashFactory,
          ),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}