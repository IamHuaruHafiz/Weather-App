import 'package:dweather/components/colors.dart';

import 'package:dweather/screens/home_screen.dart';
import 'package:dweather/screens/location_screen.dart';
import 'package:dweather/screens/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DWeather',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const LocationScreen(),
    const SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          elevation: 5,
          iconSize: 26,
          selectedItemColor: textColor,
          backgroundColor: bgColor,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              tooltip: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "My",
              icon: Icon(CupertinoIcons.location_solid),
            ),
            BottomNavigationBarItem(
              label: "settings",
              icon: Icon(CupertinoIcons.settings),
            )
          ]),
      body: screens[selectedIndex],
    );
  }
}
