import 'package:flutter/material.dart';
import 'package:game_library_app/providers/theme_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.read(themeProvider).darkMode;
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.primaryColor,
        onPressed: () {
          if (isDarkMode) {
            ref.read(themeProvider.notifier).enableLightMode();
          } else {
            ref.read(themeProvider.notifier).enableDarkMode();
          }
        },
        child: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
      ),
      appBar: AppBar(
        title: const Text('Game Library'),
      ),
      body: Row(
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
            child: Center(
              // TODO: Swap out view based on the index selected
              child: Text('selectedIndex: $_selectedIndex'),
            ),
          ),
        ],
      ),
    );
  }
}
