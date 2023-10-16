import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'amharic_quiz/amharic_quiz_page.dart';
import 'arabic_quiz/arabic_quiz_page.dart';
import 'english_quiz/english_quiz_page.dart'; // Import your Arabic quiz file
import 'oromic_quiz/oromic_quiz_page.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  bool amharicButtonClicked = false;
  bool afaanOromooButtonClicked = false;
  bool englishButtonClicked = false;
  bool arabicButtonClicked = false;

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Selection"),
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
            // Button to navigate to Amharic quiz
            _buildQuizButton(
              context,
              'Amharic Quiz',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => amharic_quiz1()),
                );
                setState(() {
                  amharicButtonClicked = true;
                  afaanOromooButtonClicked = false;
                  englishButtonClicked = false;
                  arabicButtonClicked = false;
                });
              },
              _w,
              amharicButtonClicked,
            ),
            // Button to navigate to Afaan Oromoo quiz
            _buildQuizButton(
              context,
              'Afaan Oromoo Quiz',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => oromic_quiz1(),
                  ),
                );
                setState(() {
                  amharicButtonClicked = false;
                  afaanOromooButtonClicked = true;
                  englishButtonClicked = false;
                  arabicButtonClicked = false;
                });
              },
              _w,
              afaanOromooButtonClicked,
            ),
            // Button to navigate to English quiz
            _buildQuizButton(
              context,
              'English Quiz',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => english_quiz1()),
                );
                setState(() {
                  amharicButtonClicked = false;
                  afaanOromooButtonClicked = false;
                  englishButtonClicked = true;
                  arabicButtonClicked = false;
                });
              },
              _w,
              englishButtonClicked,
            ),
            // Button to navigate to Arabic quiz
            _buildQuizButton(
              context,
              'Arabic Quiz',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => arabic_quiz1()),
                );
                setState(() {
                  amharicButtonClicked = false;
                  afaanOromooButtonClicked = false;
                  englishButtonClicked = false;
                  arabicButtonClicked = true;
                });
              },
              _w,
              arabicButtonClicked,
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
    bool isClicked,
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
          child: InkWell(
            onTap: onTap,
            child: Container(
              margin: EdgeInsets.only(bottom: width / 20),
              height: width / 4,
              decoration: BoxDecoration(
                color: isClicked ? Colors.green : Colors.white,
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
