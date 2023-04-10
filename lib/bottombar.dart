// import 'package:flutter/material.dart';
// import 'questions.dart';
// import 'package:portfolioapp/map.dart';
// import 'package:portfolioapp/partners.dart';
// import 'package:portfolioapp/services.dart';

// class MyBottomNavigationBar extends StatefulWidget {
//   MyBottomNavigationBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
// }

// class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
//   int _selectedIndex = 0;

// static List<Widget> _widgetOptions = <Widget>[
//   Questions(),
//   MapsScreen(
//     selectedCheckboxes: [],
//     textValue1: '',
//     textValue2: '',
//   ),
//   Services(),
//   Partners(),
// ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         elevation: 50,
//         type: BottomNavigationBarType.fixed,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.map_rounded),
//             label: "",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.cleaning_services_rounded),
//             label: "",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_rounded),
//             label: "",
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'questions.dart';
import 'package:portfolioapp/map.dart';
import 'package:portfolioapp/partners.dart';
import 'package:portfolioapp/services.dart';

import 'package:global_bottom_navigation_bar/global_bottom_navigation_bar.dart';

class MyBottomNavigationBar extends StatefulWidget {
  MyBottomNavigationBar({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  MyBottomNavigationBarState createState() => MyBottomNavigationBarState();
}

class MyBottomNavigationBarState extends State<MyBottomNavigationBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ScaffoldGlobalBottomNavigation(
      listOfChild: [
        Questions(),
        MapsScreen(
          selectedCheckboxes: [],
          textValue1: '',
          textValue2: '',
        ),
        Services(),
        Partners(),
      ],
      listOfBottomNavigationItem: buildBottomNavigationItemList(),
    );
  }

  List<BottomNavigationItem> buildBottomNavigationItemList() => [
        BottomNavigationItem(
          activeIcon: Icon(
            Icons.home,
            color: Colors.black87,
            size: 24,
          ),
          inActiveIcon: Icon(
            Icons.home,
            color: Colors.grey,
            size: 24,
          ),
          title: 'explore',
          color: Colors.white,
          vSync: this,
        ),
        BottomNavigationItem(
          activeIcon: Icon(
            Icons.map_rounded,
            color: Colors.black87,
            size: 24,
          ),
          inActiveIcon: Icon(
            Icons.map_rounded,
            color: Colors.grey,
            size: 24,
          ),
          title: 'favorite',
          color: Colors.white,
          vSync: this,
        ),
        BottomNavigationItem(
          activeIcon: Icon(
            Icons.cleaning_services_rounded,
            color: Colors.black87,
            size: 24,
          ),
          inActiveIcon: Icon(
            Icons.cleaning_services_rounded,
            color: Colors.grey,
            size: 24,
          ),
          title: 'learn',
          color: Colors.white,
          vSync: this,
        ),
        BottomNavigationItem(
          activeIcon: Icon(
            Icons.person_rounded,
            color: Colors.black87,
            size: 24,
          ),
          inActiveIcon: Icon(
            // Icons.star_border,
            Icons.person_rounded,
            color: Color.fromARGB(255, 11, 9, 9),
            size: 24,
          ),
          title: '',
          color: Colors.white,
          vSync: this,
        ),
      ];
}
//flutter pub publish --dry-run