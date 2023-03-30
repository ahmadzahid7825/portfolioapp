import 'package:flutter/material.dart';
import 'questions.dart';
import 'package:portfolioapp/map.dart';
import 'package:portfolioapp/partners.dart';
import 'package:portfolioapp/services.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Questions(),
    MapsScreen(),
    Services(),
    Partners(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 50,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_rounded),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cleaning_services_rounded),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
