import 'package:flutter/material.dart';
import 'package:game_library_app/providers/app_theme_provider.dart';
import 'package:game_library_app/widgets/main_menu.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    final _isDarkMode = ref.read(appThemeStateProvider);
    final _themeStateProvider = ref.read(appThemeStateProvider.notifier);
    final _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _theme.backgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: _theme.primaryColor,
        onPressed: () {
          _themeStateProvider.toggleAppTheme(context, ref);
        },
        child: Icon(_isDarkMode ? Icons.dark_mode : Icons.light_mode),
      ),
      appBar: AppBar(
        title: const Text('Game Library'),
      ),
      body: const MainMenu(),
    );
  }
}
