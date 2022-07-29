import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainMenuMobile extends StatefulWidget {
  MainMenuMobile({Key? key, required int selectedIndex}) : super(key: key);
  int selectedIndex = 0;

  @override
  State<MainMenuMobile> createState() => _MainMenuMobileState();
}

class _MainMenuMobileState extends State<MainMenuMobile> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.selectedIndex,
      onTap: (int index) {
        setState(() {
          widget.selectedIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined),
          activeIcon: Icon(Icons.explore),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.gamepad_outlined),
          activeIcon: Icon(Icons.gamepad),
          label: 'Library',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          activeIcon: Icon(Icons.account_circle),
          label: 'My Profile',
        ),
      ],
    );
  }
}
