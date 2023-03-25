import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'map.dart';

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
      home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
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
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Nom et prénom?',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    TextFormField(
                      controller: _textController1,
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Numéro de téléphone:',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _textController2,
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Assurance Auto',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    CheckboxListTile(
                      title: const Text('Assurance Auto'),
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
                      title: const Text('Europe Assistance'),
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
                      title: const Text('Mobile24'),
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
                      title: const Text('Autres assurances'),
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
                                builder: (context) => MapsScreen()));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.black87),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.fromLTRB(0, 15, 0, 15)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      child: const Text('Next'),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
