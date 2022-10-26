import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppFrame extends StatefulWidget {
  const AppFrame({super.key});
  @override
  State<AppFrame> createState() => AppFrameStateful();
}

class AppFrameStateful extends State<AppFrame> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white70),
            activeIcon: Icon(Icons.home, color: Colors.white),
            backgroundColor: Color(0xff2699FB),
            label: 'Create Party',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.white70),
            activeIcon: Icon(Icons.notifications, color: Colors.white),
            backgroundColor: Color(0xff2699FB),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.white70),
            activeIcon: Icon(Icons.search, color: Colors.white),
            backgroundColor: Color(0xff2699FB),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white70),
            activeIcon: Icon(Icons.person, color: Colors.white),
            backgroundColor: Color(0xff2699FB),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.white70),
            activeIcon: Icon(Icons.settings, color: Colors.white),
            backgroundColor: Color(0xff2699FB),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        showSelectedLabels: false,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded,
                  color: Color(0xff2699FB)),
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          'PARTIES',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff2699FB),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
