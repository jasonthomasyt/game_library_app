import 'package:flutter/material.dart';
import 'package:game_library_app/utils/shared_utility.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appThemeStateProvider =
    StateNotifierProvider<AppThemeNotifier, bool>((ref) {
  final _isDarkMode = ref.read(sharedUtilityProvider).isDarkModeEnabled();
  return AppThemeNotifier(defaultDarkModeValue: _isDarkMode);
});

class AppThemeNotifier extends StateNotifier<bool> {
  AppThemeNotifier({required this.defaultDarkModeValue})
      : super(defaultDarkModeValue);

  final bool defaultDarkModeValue;

  void toggleAppTheme(BuildContext context, WidgetRef ref) {
    final bool _isDarkModeEnabled =
        ref.read(sharedUtilityProvider).isDarkModeEnabled();
    final _toggleValue = !_isDarkModeEnabled;

    ref
        .read(sharedUtilityProvider)
        .setDarkModeEnabled(value: _toggleValue)
        .whenComplete(
          () => {
            state = _toggleValue,
          },
        );
  }
}
