// import flutter pkgs
import 'package:flutter/material.dart';

class TealAccentVariation1 extends StatelessWidget {
  // default constructor function
  const TealAccentVariation1(this.welcomeText, {super.key});

  final String welcomeText;

  // defining sub constructor function, example of multiple constructor functions of a same class
  const TealAccentVariation1.welcomeText2(String welcomeText2, {super.key}) : welcomeText = welcomeText2;

  @override
  Widget build(BuildContext context) {
    return Text(
      welcomeText,
      style: const TextStyle(
        color: Colors.tealAccent,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
        fontFamily: 'Poppins',
        wordSpacing: 1.5,
        fontStyle: FontStyle.italic,
      ),
      textAlign: TextAlign.center,
    );
  }
}
