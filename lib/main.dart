import 'package:flutter/material.dart';
import 'package:game_library_app/home.dart';
import 'package:game_library_app/state_management/providers/theme_provider.dart';
import 'package:game_library_app/utils/shared_utility.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const GameLibraryApp(),
    ),
  );
}

class GameLibraryApp extends ConsumerWidget {
  const GameLibraryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeStateProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ref
          .read(themeProvider)
          .getThemeData(context, isDarkModeEnabled: currentTheme),
      home: const Home(),
    );
  }
}
