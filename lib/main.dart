import 'package:flutter/material.dart';
import 'package:game_library_app/home.dart';
import 'package:game_library_app/providers/theme_provider.dart';
import 'package:game_library_app/shared/app_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: GameLibraryApp(),
    ),
  );
}

class GameLibraryApp extends ConsumerWidget {
  const GameLibraryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: currentTheme.darkMode ? ThemeMode.dark : ThemeMode.light,
      home: const Home(),
    );
  }
}
