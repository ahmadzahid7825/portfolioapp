import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'map.dart';
import 'package:http/http.dart' as http;

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  bool _checkBoxValue1 = false;
  bool _checkBoxValue2 = false;
  bool _checkBoxValue3 = false;
  bool _checkBoxValue4 = false;

  final TextEditingController _textController1 = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();

  
  @override
  void dispose() {
    _textController1.dispose();
    _textController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _buildTheme(Brightness.light),
      home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 238, 238, 238),
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                ),
              )),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Nom et prénom?',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _textController1,
                        ),
                        const SizedBox(height: 40),
                        const Text(
                          'Numéro de téléphone:',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _textController2,
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'Assurance Auto',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1),
                        ),
                        CheckboxListTile(
                          title: const Text(
                            'Assurance Auto',
                            style: TextStyle(letterSpacing: .8),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          checkColor: Colors.white,
                          checkboxShape: const CircleBorder(),
                          activeColor: Colors.black,
                          value: _checkBoxValue1,
                          onChanged: (value) {
                            setState(() {
                              _checkBoxValue1 = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text(
                            'Europe Assistance',
                            style: TextStyle(letterSpacing: .8),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          checkColor: Colors.white,
                          checkboxShape: const CircleBorder(),
                          activeColor: Colors.black,
                          value: _checkBoxValue2,
                          onChanged: (value) {
                            setState(() {
                              _checkBoxValue2 = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text(
                            'Mobile24',
                            style: TextStyle(letterSpacing: .8),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          checkColor: Colors.white,
                          checkboxShape: const CircleBorder(),
                          activeColor: Colors.black,
                          value: _checkBoxValue3,
                          onChanged: (value) {
                            setState(() {
                              _checkBoxValue3 = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text(
                            'Autres assurances',
                            style: TextStyle(letterSpacing: .8),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          checkColor: Colors.white,
                          checkboxShape: const CircleBorder(),
                          activeColor: Colors.black,
                          value: _checkBoxValue4,
                          onChanged: (value) {
                            setState(() {
                              _checkBoxValue4 = value!;
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MapsScreen()));
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.black87),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.fromLTRB(0, 15, 0, 15)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                          child: Text(
                            'NEXT',
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
    textTheme: GoogleFonts.robotoCondensedTextTheme(baseTheme.textTheme),
  );
}
