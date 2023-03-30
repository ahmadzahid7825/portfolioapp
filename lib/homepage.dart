import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolioapp/questions.dart';

import 'bottombar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/splashlogo.png'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyBottomNavigationBar(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(35, 15, 35, 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                backgroundColor: Colors.black87,
              ),
              child: Text(
                'COMMENCER',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      letterSpacing: .5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
