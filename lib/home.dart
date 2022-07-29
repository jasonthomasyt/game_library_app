import 'package:flutter/material.dart';
import 'package:game_library_app/features/explore/explore.dart';
import 'package:game_library_app/features/library/library.dart';
import 'package:game_library_app/features/main_menu/widgets/main_menu_mobile.dart';
import 'package:game_library_app/features/main_menu/widgets/main_menu_web.dart';
import 'package:game_library_app/features/my_profile/my_profile.dart';
import 'package:game_library_app/state_management/providers/theme_provider.dart';
import 'package:game_library_app/extensions/build_context_extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    final _isDarkMode = ref.read(themeStateProvider);
    final _themeStateProvider = ref.read(themeStateProvider.notifier);
    final _theme = Theme.of(context);
    const int _selectedIndex = 0;

    const pages = [Explore(), Library(), MyProfile()];

    return Scaffold(
      backgroundColor: _theme.backgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: _theme.primaryColor,
        onPressed: () {
          _themeStateProvider.toggleTheme(context, ref);
        },
        child: Icon(_isDarkMode ? Icons.dark_mode : Icons.light_mode),
      ),
      appBar: AppBar(
        title: const Text('Game Library'),
      ),
      body: context.isMobile
          ? Center(
              child: pages[_selectedIndex],
            )
          : MainMenuWeb(selectedIndex: _selectedIndex),
      bottomNavigationBar: context.isMobile
          ? MainMenuMobile(selectedIndex: _selectedIndex)
          : null,
    );
  }
}
