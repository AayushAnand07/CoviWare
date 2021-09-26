import 'package:flutter/material.dart';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/services.dart';

import 'Pages/Covid World Report/covid_world.dart';
import 'Pages/Home/home.dart';
import 'Pages/News/health_news.dart';
import 'Pages/Slot Book/covid_slot_booking.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Color(0xff0E1229),
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: buildPages(),
        bottomNavigationBar: buildBottomNavigator(),
      ),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 1:
        return SlotBook();
      case 2:
        return HealthNews();
      case 3:
        return CovidWorld();
      case 0:
      default:
        return Home();
    }
  }

  Widget buildBottomNavigator() {
    return BottomNavyBar(
      showElevation: true,
      backgroundColor: Color(0xffecedfc),
      selectedIndex: index,
      containerHeight: 70,
      onItemSelected: (index) => setState(() => this.index = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          activeColor: Color(0xff25188f),
          inactiveColor: Color(0xff0E1229),
          icon: Icon(Icons.apps),
          title: Text('home'),
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          activeColor: Color(0xff25188f),
          inactiveColor: Color(0xff0E1229),
          icon: Icon(Icons.search),
          title: Text(
            'Slot Book',
            style: TextStyle(fontSize: 15),
          ),
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          activeColor: Color(0xff25188f),
          inactiveColor: Color(0xff0E1229),
          icon: Icon(Icons.text_snippet_outlined),
          title: Text('News'),
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          activeColor: Color(0xff25188f),
          inactiveColor: Color(0xff0E1229),
          icon: Icon(Icons.bar_chart),
          title: Text(
            'World Report',
            style: TextStyle(fontSize: 10),
          ),
        ),
      ],
    );
  }
}
