import 'package:flutter/material.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

class CikarmaOgren extends StatefulWidget {
  @override
  _CikarmaOgrenState createState() => _CikarmaOgrenState();
}

class _CikarmaOgrenState extends State<CikarmaOgren> {
  late int number1;
  late int number2;
  late int result;
  late int correctOption;
  late bool showResultDialog;

  @override
  void initState() {
    super.initState();
    generateMathProblem();
  }

  void generateMathProblem() {
    setState(() {
      number1 = Random().nextInt(10) + 1;
      number2 = Random().nextInt(10) + 1;
      result = number1 - number2;
      correctOption = Random().nextInt(3);
      showResultDialog = false;
    });
  }

  void checkAnswer(int selectedOption) {
    setState(() {
      showResultDialog = true;
      if (selectedOption == correctOption) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return WillPopScope(
              onWillPop: () async => false,
              child: AlertDialog(
                title: Text('Tebrikler!'),
                content: Text('Doğru bildiniz!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      generateMathProblem();
                      Navigator.pop(context);
                    },
                    child: Text('Devam Et'),
                  ),
                ],
              ),
            );
          },
        );
      } else {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return WillPopScope(
              onWillPop: () async => false,
              child: AlertDialog(
                title: Text('Üzgünüm!'),
                content: Text('Cevabınız yanlış.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Tekrar Dene'),
                  ),
                ],
              ),
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7AE6F6),
      appBar: AppBar(
        title: Text('Çıkarma Öğren',
            style: GoogleFonts.archivoBlack()),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 70),
          Container(
            color: Color(0xFFD3D0E1),
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 25),
            child: Text("Aşağıdaki Soruyu Cevaplayın", style: GoogleFonts.titanOne(fontSize: 24)),
          ),
          SizedBox(height: 120),
          Text(
            '$number1 - $number2 = ?',
            style: TextStyle(fontSize: 32),
          ),
          SizedBox(height: 40),
          Column(
            children: List.generate(3, (index) {
              if (index == correctOption) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      checkAnswer(index);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle: TextStyle(fontSize: 24),
                    ),
                    child: Text(
                      result.toString(),
                    ),
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      checkAnswer(index);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle: TextStyle(fontSize: 24),
                    ),
                    child: Text(
                      getRandomWrongOption().toString(),
                    ),
                  ),
                );
              }
            }),
          ),
          SizedBox(height: 20),
          showResultDialog ? Text('') : Container(),
        ],
      ),
    );
  }

  int getRandomWrongOption() {
    int wrongOption;
    do {
      wrongOption = Random().nextInt(20) + 1;
    } while (wrongOption == result);
    return wrongOption;
  }
}
