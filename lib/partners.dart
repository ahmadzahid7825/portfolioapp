import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:google_fonts/google_fonts.dart';

class Partners extends StatelessWidget {
  const Partners({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 248, 247, 247),
          appBar: AppBar(
            toolbarHeight: 60,
            elevation: 0,
            title: Text(
              'Nos partenaires',
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  fontSize: 27,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Bounceable(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: const Image(
                          width: double.infinity,
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/sp3.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Bounceable(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: const Image(
                          width: double.infinity,
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/sp4.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Bounceable(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: const Image(
                          width: double.infinity,
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/sp1.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Bounceable(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: const Image(
                          width: double.infinity,
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/sp2.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
