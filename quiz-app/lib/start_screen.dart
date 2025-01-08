import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Custom Widget
// Пользовательские виджеты желательно хранить в отдельном файле
// Такие виджеты в дальнейшем будут использоваться в программе многократно
class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            // color: const Color(0xFFFFFFFF)
          ),
          const SizedBox(height: 50),
          Text(
            'Bilgi yarışmasına hoş geldiniz!',
            style: GoogleFonts.manrope(
              color: const Color(0xFFEBEFFB),
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 30),
          TextButton.icon(
            onPressed: () {
              startQuiz();
            },
            icon: const Icon(Icons.arrow_right_alt), // стрелка
            label: Text('Başla!', style: GoogleFonts.manrope(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color(0xFF233783),
              foregroundColor: const Color(0xFFFFFFFF), // цвет текста кнопки
              side: const BorderSide(color: Color(0xFFFFFFFF)), // цвет границы кнопки
            ),
          ),
        ],
      ),
    );
  }
}