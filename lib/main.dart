import 'package:flutter/material.dart';
import 'package:global_bottom_navigation_bar/global_bottom_navigation_bar.dart';
import 'package:portfolioapp/homepage.dart';
import 'package:portfolioapp/map.dart';
import 'package:portfolioapp/partners.dart';
import 'package:portfolioapp/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Portolio App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ScaffoldGlobalBottomNavigation(
      listOfChild: const [
        HomePage(),
        Services(),
        Partners(),
        MapsScreen(),
      ],
      listOfBottomNavigationItem: buildBottomNavigationItemList(),
    );
  }

  List<BottomNavigationItem> buildBottomNavigationItemList() => [
        BottomNavigationItem(
          activeIcon: const Icon(
            Icons.home,
            color: Colors.lightBlue,
            size: 28,
          ),
          color: Colors.white,
          inActiveIcon: const Icon(
            Icons.home,
            color: Colors.grey,
            size: 28,
          ),
          vSync: this,
        ),
        BottomNavigationItem(
          activeIcon: const Icon(
            Icons.person,
            color: Colors.lightBlue,
            size: 28,
          ),
          color: Colors.white,
          inActiveIcon: const Icon(
            Icons.person_outline,
            color: Colors.grey,
            size: 28,
          ),
          vSync: this,
        ),
        BottomNavigationItem(
          activeIcon: const Icon(
            Icons.settings,
            color: Colors.lightBlue,
            size: 28,
          ),
          color: Colors.white,
          inActiveIcon: const Icon(
            Icons.settings,
            color: Colors.grey,
            size: 28,
          ),
          vSync: this,
        ),
        BottomNavigationItem(
          activeIcon: const Icon(
            Icons.map_rounded,
            color: Colors.lightBlue,
            size: 28,
          ),
          color: Colors.white,
          inActiveIcon: const Icon(
            Icons.map_rounded,
            color: Colors.grey,
            size: 28,
          ),
          vSync: this,
        ),
      ];
}
