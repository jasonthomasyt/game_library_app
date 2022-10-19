import 'package:flutter/material.dart';
import 'package:game_library_app/utils/shared_utility.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier({required this.defaultDarkModeValue})
      : super(defaultDarkModeValue);

  final bool defaultDarkModeValue;

  void toggleTheme(BuildContext context, WidgetRef ref) {
    final bool isDarkModeEnabled =
        ref.read(sharedUtilityProvider).isDarkModeEnabled();
    final toggleValue = !isDarkModeEnabled;

    ref
        .read(sharedUtilityProvider)
        .setDarkModeEnabled(value: toggleValue)
        .whenComplete(
          () => {
            state = toggleValue,
          },
        );
  }
}
