import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class Partners extends StatelessWidget {
  const Partners({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color.fromARGB(179, 255, 249, 249),
          appBar: AppBar(
            title: const Text(
              'Nos Partners',
              style: TextStyle(
                fontSize: 27,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Bounceable(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: const Image(
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/part1.png'),
                      ),
                    )),
                Bounceable(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: const Image(
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/part1.png'),
                      ),
                    )),
              ],
            ),
          )),
    );
  }
}
