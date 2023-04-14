import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Services extends StatelessWidget {
  Services({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          elevation: 0,
          title: Text(
            'Nos Solutions',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 27,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Bounceable(
                  onTap: () async {
                    final Uri _url = Uri.parse(
                        'https://www.p-c-r.ch/service-de-reparation/');
                    if (!await launchUrl(_url)) {
                      throw Exception('Could not launch $_url');
                    }
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 236, 236, 236),
                        ),
                        child: const Image(
                            image: AssetImage('assets/images/ser1.png')),
                      ),
                      const Text('Frein')
                    ],
                  ),
                ),
                Bounceable(
                  onTap: () async {
                    final Uri _url = Uri.parse(
                        'https://www.p-c-r.ch/service-de-reparation/');
                    if (!await launchUrl(_url)) {
                      throw Exception('Could not launch $_url');
                    }
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 236, 236, 236),
                        ),
                        child: const Image(
                            image: AssetImage('assets/images/ser4.png')),
                      ),
                      const Text('Batterie')
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Bounceable(
                  onTap: () async {
                    final Uri _url =
                        Uri.parse('https://www.p-c-r.ch/depannage/');
                    if (!await launchUrl(_url)) {
                      throw Exception('Could not launch $_url');
                    }
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 236, 236, 236),
                        ),
                        child: const Image(
                            image: AssetImage('assets/images/ser2.png')),
                      ),
                      const Text('Dépannage de véhicule')
                    ],
                  ),
                ),
                Bounceable(
                  onTap: () async {
                    final Uri _url = Uri.parse(
                        'https://www.p-c-r.ch/service-de-reparation/');
                    if (!await launchUrl(_url)) {
                      throw Exception('Could not launch $_url');
                    }
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 236, 236, 236),
                        ),
                        child: const Image(
                            image: AssetImage('assets/images/ser3.png')),
                      ),
                      const Text('Chaîne d\'hiver')
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
