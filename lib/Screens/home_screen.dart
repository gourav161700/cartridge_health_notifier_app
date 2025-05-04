import 'package:flutter/material.dart';
import 'package:water_notifier_app/Widgets/add_filter_module.dart';
import 'package:water_notifier_app/Widgets/home_widget.dart';
import 'dart:math';

import 'package:water_notifier_app/Widgets/profile_widet.dart';

// import 'package:water_notifier_app/Screens/profile_screen.dart';

// import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  final bool isNewUser;
  const HomeScreen({super.key, required this.isNewUser});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Bottom Navigation index number
  int _bottomNavigationIndexNumber = 0;

  final List<Widget> pages = [HomeWidget(), ProfileWidget()];

  @override
  void initState() {
    super.initState();
    widget.isNewUser
        ? WidgetsBinding.instance.addPostFrameCallback(
          (_) => AddNewFilterPopup.showFilterDialog(context),
        )
        : () {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Hello,',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 59, 59, 59),
                fontSize: 25.0,
              ),
            ),
            SizedBox(width: 10.0),
            Text(
              'User',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                fontSize: 25.0,
              ),
            ),
            SizedBox(width: 5.0),
            Image.asset('assets/wave.png', height: 30.0, fit: BoxFit.contain),
          ],
        ),
        actions: [
          _bottomNavigationIndexNumber == 0
              ? Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ClipOval(
                  child: Container(
                    width: 40, // smaller size
                    height: 40,
                    color: const Color.fromARGB(255, 220, 219, 219),
                    child: IconButton(
                      onPressed: () {},
                      icon: Transform.rotate(
                        angle: pi / 10,
                        child: Icon(Icons.notifications_active),
                      ),
                    ),
                  ),
                ),
              )
              : Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ClipOval(
                  child: Container(
                    width: 40, // smaller size
                    height: 40,
                    color: const Color.fromARGB(255, 220, 219, 219),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.logout_rounded, size: 25.0),
                    ),
                  ),
                ),
              ),
        ],
      ),

      body: pages[_bottomNavigationIndexNumber],

      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30.0,
        selectedItemColor: Colors.grey.shade800,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: _bottomNavigationIndexNumber,
        elevation: 2.0,
        onTap: (index) {
          setState(() {
            _bottomNavigationIndexNumber = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
