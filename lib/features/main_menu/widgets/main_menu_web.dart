import 'package:flutter/material.dart';
import 'package:game_library_app/features/explore/explore.dart';
import 'package:game_library_app/features/library/library.dart';
import 'package:game_library_app/features/my_profile/my_profile.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          labelType: NavigationRailLabelType.selected,
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.gamepad_outlined),
              selectedIcon: Icon(Icons.gamepad),
              label: Text('Library'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.explore_outlined),
              selectedIcon: Icon(Icons.explore),
              label: Text('Explore'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.account_circle_outlined),
              selectedIcon: Icon(Icons.account_circle),
              label: Text('My Profile'),
            ),
          ],
        ),
        Expanded(
          child: _getView(_selectedIndex),
        ),
      ],
    );
  }

  Widget _getView(int selectedIndex) {
    switch (selectedIndex) {
      case 1:
        return const Explore();
      case 2:
        return const MyProfile();
      default:
        return const Library();
    }
  }
}
