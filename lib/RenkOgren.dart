import 'package:flutter/material.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

class RenkOgren extends StatefulWidget {
  @override
  _RenkOgrenState createState() => _RenkOgrenState();
}

class _RenkOgrenState extends State<RenkOgren> {
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
  ];

  late Color correctColor;
  bool showResultDialog = false;

  @override
  void initState() {
    super.initState();
    generateColor();
  }

  void generateColor() {
    setState(() {
      correctColor = colors[Random().nextInt(colors.length)];
      colors.shuffle();
      showResultDialog = false;
    });
  }

  void checkAnswer(Color selectedColor) {
    setState(() {
      showResultDialog = true;
      if (selectedColor == correctColor) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return WillPopScope(
              onWillPop: () async => false,
              child: AlertDialog(
                title: Text('Tebrikler!'),
                content: Text('Doğru Bildin!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      generateColor();
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
                content: Text('Yanlış.'),
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
        title: Text('Renkleri Öğren',
            style: GoogleFonts.archivoBlack()),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 200,
              width: 200,
              color: correctColor,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              children: colors.map((color) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(
                    onPressed: () {
                      checkAnswer(color);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF1B4E7E),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    ),
                    child: Text(
                      colorName(color),
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: generateColor,
            child: Text('Yeni Renk'),

          ),
          SizedBox(height: 20),
          showResultDialog ? Text('') : Container(),
        ],
      ),
    );
  }

  String colorName(Color color) {
    if (color == Colors.red) {
      return 'Kırmızı';
    } else if (color == Colors.blue) {
      return 'Mavi';
    } else if (color == Colors.green) {
      return 'Yeşil';
    } else if (color == Colors.yellow) {
      return 'Sarı';
    } else {
      return '';
    }
  }
}
