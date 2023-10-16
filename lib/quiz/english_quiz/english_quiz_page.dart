import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import '/quiz/english_quiz/screens/welcome/welcome_screen.dart';

class english_quiz1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: WelcomeScreen(),
    );
  }
}
