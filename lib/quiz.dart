import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/questions.dart';
import 'start_screen.dart';
import 'questions_screen.dart';
import 'results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = []; // to store user's answers
  // First Way (without initState())
  var activeScreen = 'start-screen'; // displays app's start screen

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen'; // displays questions screen of the app
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  // user's answered questions
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            'Bilgi Yarışması',
            style: GoogleFonts.manrope(
              color: const Color(0xFFFFFFFF),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1), // Высота разделителя
            child: Divider(
              color: Color( 0xFFFFFFFF), // Цвет линии
              thickness: 1, // Толщина линии
              height: 1, // Высота разделителя
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF233783),
                Color(0xFF3b5bdb),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen == 'start-screen'
              ? StartScreen(switchScreen)
              : activeScreen == 'results-screen'
                  ? ResultsScreen(
                      onRestart: restartQuiz, chosenAnswers: selectedAnswers) // passing restartQuiz function as a value
                  : QuestionsScreen(onSelectAnswer: chooseAnswer), // passing chooseAnswer function as a value
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
