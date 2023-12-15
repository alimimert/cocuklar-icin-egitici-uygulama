import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidapp/CikarmaOgren.dart';
import 'package:kidapp/RenkOgren.dart';

import 'ToplamaOgren.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7AE6F6),
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          'ÖĞRETİCİ UYGULAMA',
          style: GoogleFonts.archivoBlack(
            textStyle: TextStyle(fontSize: 24),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/foto2.png'),
            fit: BoxFit.contain,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Harfleri Öğren butonuna basıldığında yapılacak işlemler
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ToplamaOgren()));
                },
                child: Text(
                  'Toplama Öğren',
                  style: GoogleFonts.titanOne(
                    textStyle: TextStyle(fontSize: 24),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[800],
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Sayıları Öğren butonuna basıldığında yapılacak işlemler
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => CikarmaOgren()));
                },
                child: Text(
                  'Çıkarma Öğren',
                  style: GoogleFonts.titanOne(
                    textStyle: TextStyle(fontSize: 24),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[800],
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Renkleri Öğren butonuna basıldığında yapılacak işlemler
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => RenkOgren()));
                },
                child: Text(
                  'Renkleri Öğren',
                  style: GoogleFonts.titanOne(
                    textStyle: TextStyle(fontSize: 24),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[800],
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
