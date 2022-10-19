import 'package:flutter/material.dart';

class MainMenuMobile extends StatefulWidget {
  const MainMenuMobile(
      {Key? key, required this.selectedIndex, required this.onItemTapped})
      : super(key: key);
  final int selectedIndex;
  final ValueSetter<int> onItemTapped;

  @override
  State<MainMenuMobile> createState() => _MainMenuMobileState();
}

class _MainMenuMobileState extends State<MainMenuMobile> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.selectedIndex,
      onTap: widget.onItemTapped,
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
