import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '/grammer/english_grammer.dart';
import '../grammer/AfanOromoGrammarApp.dart';
import '../grammer/AmharicGrammarApp.dart';
import '../grammer/EnglishGrammarApp.dart';
import '../quiz/quiz.dart';

import '../grammer/ArabicGrammarApp.dart';

class LearnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn Selection"),
        centerTitle: true,
        brightness: Brightness.dark,
      ),
      body: AnimationLimiter(
        child: ListView(
          padding: EdgeInsets.all(_w / 30),
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            // Button to navigate to Learn English
            _buildQuizButton(
              context,
              'Learn English',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EnglishGrammarApp()),
                );
              },
              _w,
            ),
            // Button to navigate to Learn Arabic
            _buildQuizButton(
              context,
              'Learn Arabic',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ArabicGrammarApp()),
                );
              },
              _w,
            ),

            // Button to navigate to Learn Amharic
            _buildQuizButton(
              context,
              'Learn Amharic',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AmharicGrammarApp()),
                );
              },
              _w,
            ),
            // Button to navigate to Learn Afaan Oromo
            _buildQuizButton(
              context,
              'Learn Afaan Oromo',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AfanOromoGrammarApp()),
                );
              },
              _w,
            ),
            // Button to navigate to Quiz
            _buildQuizButton(
              context,
              'Quiz',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen()),
                );
              },
              _w,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizButton(
    BuildContext context,
    String buttonText,
    VoidCallback onTap,
    double width,
  ) {
    return AnimationConfiguration.staggeredList(
      duration: const Duration(milliseconds: 2500),
      position: 0,
      child: SlideAnimation(
        duration: const Duration(milliseconds: 2500),
        curve: Curves.fastLinearToSlowEaseIn,
        horizontalOffset: 30,
        verticalOffset: 300.0,
        child: FlipAnimation(
          duration: const Duration(milliseconds: 3000),
          curve: Curves.fastLinearToSlowEaseIn,
          flipAxis: FlipAxis.y,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              margin: EdgeInsets.only(bottom: width / 20),
              height: width / 4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 40,
                    spreadRadius: 10,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                buttonText,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
