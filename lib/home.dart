import 'package:flutter/material.dart';
import 'package:game_library_app/extensions/build_context_extensions.dart';
import 'package:game_library_app/features/explore/explore.dart';
import 'package:game_library_app/features/library/library.dart';
import 'package:game_library_app/features/main_menu/widgets/main_menu_mobile.dart';
import 'package:game_library_app/features/main_menu/widgets/main_menu_web.dart';
import 'package:game_library_app/features/my_profile/my_profile.dart';
import 'package:game_library_app/state_management/providers/theme_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.read(themeStateProvider);
    final currentThemeStateProvider = ref.read(themeStateProvider.notifier);
    final theme = Theme.of(context);
    const int selectedIndex = 0;

    const pages = [Explore(), Library(), MyProfile()];

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.primaryColor,
        onPressed: () {
          currentThemeStateProvider.toggleTheme(context, ref);
        },
        child: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
      ),
      appBar: AppBar(
        title: const Text('Game Library'),
      ),
      body: context.isMobile
          ? Center(
              child: pages[selectedIndex],
            )
          : const MainMenuWeb(selectedIndex: selectedIndex),
      bottomNavigationBar: context.isMobile
          ? const MainMenuMobile(selectedIndex: selectedIndex)
          : null,
    );
  }
}
