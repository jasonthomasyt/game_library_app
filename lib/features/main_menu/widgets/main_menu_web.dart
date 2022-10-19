import 'package:flutter/material.dart';
import 'package:game_library_app/features/explore/explore.dart';
import 'package:game_library_app/features/library/library.dart';
import 'package:game_library_app/features/my_profile/my_profile.dart';

class MainMenuWeb extends StatefulWidget {
  const MainMenuWeb(
      {Key? key, required this.selectedIndex, required this.onItemTapped})
      : super(key: key);
  final int selectedIndex;
  final ValueSetter<int> onItemTapped;

  @override
  State<MainMenuWeb> createState() => _MainMenuWebState();
}

class _MainMenuWebState extends State<MainMenuWeb> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          selectedIndex: widget.selectedIndex,
          onDestinationSelected: widget.onItemTapped,
          labelType: NavigationRailLabelType.selected,
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.explore_outlined),
              selectedIcon: Icon(Icons.explore),
              label: Text('Explore'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.gamepad_outlined),
              selectedIcon: Icon(Icons.gamepad),
              label: Text('Library'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.account_circle_outlined),
              selectedIcon: Icon(Icons.account_circle),
              label: Text('My Profile'),
            ),
          ],
        ),
        Expanded(
          child: IndexedStack(
            index: widget.selectedIndex,
            children: const [
              Explore(),
              Library(),
              MyProfile(),
            ],
          ),
        ),
      ],
    );
  }
}
