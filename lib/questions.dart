import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolioapp/bottombar.dart';
import 'map.dart';
import 'package:http/http.dart' as http;

class Questions extends StatefulWidget {
  Questions({super.key});

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
  final TextEditingController _textController3 = TextEditingController();
  final TextEditingController _textController4 = TextEditingController();
  final TextEditingController _textController5 = TextEditingController();
  final TextEditingController _textController6 = TextEditingController();

  Future<void> sendDatatoUrl() async {
    final response = await http.post(
      Uri.parse(
          'http://prestige-car-assistance.ch/wp-json/myplugin/v1/save_form?prenom=$_textController1&phone=$_textController2&service=$_checkBoxValue1$_checkBoxValue2$_checkBoxValue3$_checkBoxValue4&address=$_textController3&vehicle=$_textController4&cp=$_textController5&plaque=$_textController6'),
    );

    if (response.statusCode == 200) {
      print('Data saved successfully!');
    } else {
      print('Failed to save data. Error code: ${response.statusCode}');
    }
  }

  void _submit() {
    String textValue1 = _textController1.text;
    String textValue2 = _textController2.text;
    String textValue3 = _textController3.text;
    String textValue4 = _textController4.text;
    String textValue5 = _textController5.text;
    String textValue6 = _textController6.text;
    List<String> selectedCheckboxes = [];
    if (_checkBoxValue1) selectedCheckboxes.add("Assurance Auto");
    if (_checkBoxValue2) selectedCheckboxes.add("Europe Assistance");
    if (_checkBoxValue3) selectedCheckboxes.add("Mobile24");
    if (_checkBoxValue4) selectedCheckboxes.add("Autres assurances");
    Navigator.push(
      context,
      MaterialPageRoute(
        // builder: (context) => MyBottomNavigationBar(),
        builder: (context) => MapsScreen(
          selectedCheckboxes: selectedCheckboxes,
          textValue1: textValue1,
          textValue2: textValue2,
        ),
      ),
    );
  }

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
                          'Nom et prénom :',
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
                          'Adresse :',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _textController3,
                        ),
                        const SizedBox(height: 40),
                        const Text(
                          'CP et lieu :',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _textController4,
                        ),
                        const SizedBox(height: 40),
                        const Text(
                          'Type de véhicule :',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _textController5,
                        ),
                        const SizedBox(height: 40),
                        const Text(
                          'N°plaque :',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _textController6,
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
                            'Allianz Assistance',
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
                            'Mobi24',
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
                            'Autres assurances',
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
                            sendDatatoUrl();
                            _submit();
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
                            'Suivant',
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
