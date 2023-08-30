// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:amazone_prime_video/screens/screen_download.dart';
import 'package:amazone_prime_video/screens/screenFind/screen_find.dart';
import 'package:amazone_prime_video/screens/screen_home/screen_home.dart';
import 'package:flutter/material.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({super.key});

  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenMain> {
  int _currentIndex = 0;
  final pageList = [
    ScreenHome(),
    ScreenDownload(),
    ScreenFind(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.white, // Selected tab icon color
        unselectedItemColor: Colors.grey, // Unselected tab icon color
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.file_download_outlined,
            ),
            label: 'Downloads',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_sharp,
            ),
            label: 'Find',
          ),
        ],
      ),
    );
  }
}
