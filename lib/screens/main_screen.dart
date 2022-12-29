import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:modiriat_maly/screens/home.dart';
import 'package:modiriat_maly/screens/info.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({Key? key}) : super(key: key);

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int currentIndex = 0;
  Widget body = const Home();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: const [Icons.home_outlined, Icons.info_outline_rounded],
          iconSize: 40.0,
          backgroundColor: Color.fromARGB(70, 68, 156, 232),
          activeIndex: currentIndex,
          inactiveColor: Color.fromARGB(255, 179, 205, 231),
          activeColor: Colors.orange,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.smoothEdge,
          onTap: (index) {
            if (index == 0) {
              body = const Home();
            } else {
              body = const Info();
            }
            setState(() {
              currentIndex = index;
            });
          }

          //other params
          ),
      body: body,
    );
  }
}
