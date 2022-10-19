import 'package:flutter/material.dart';

class MainMenuMobile extends StatefulWidget {
  const MainMenuMobile({Key? key, required int selectedIndex})
      : super(key: key);
  final int selectedIndex = 0;

  @override
  State<MainMenuMobile> createState() => _MainMenuMobileState();
}

class _MainMenuMobileState extends State<MainMenuMobile> {
  int index = 0;

  @override
  void initState() {
    index = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (int currentIndex) {
        setState(() {
          index = currentIndex;
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
