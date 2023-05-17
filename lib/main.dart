import 'package:fashion_mobile_ui/screen/home_screen.dart';
import 'package:fashion_mobile_ui/screen/wellcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Fashion',
      theme: ThemeData(
        fontFamily: 'Fonarto'
      ),
      home: WellComeScreen()
    );
  }
}
