import 'package:flutter/material.dart';
import 'package:portfolioapp/questions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/splashlogo.png'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Questions()));
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(35, 15, 35, 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                backgroundColor: Colors.black87,
              ),
              child: const Text(
                'COMMENCER',
                style: TextStyle(fontSize: 15, letterSpacing: .5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
