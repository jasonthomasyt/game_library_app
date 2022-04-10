import 'package:game_library_app/state_management/notifiers/theme_notifier.dart';
import 'package:game_library_app/theme/theme.dart';
import 'package:game_library_app/utils/shared_utility.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final themeProvider = Provider<Theme>((ref) {
  return Theme();
});

final themeStateProvider = StateNotifierProvider<ThemeNotifier, bool>((ref) {
  final _isDarkMode = ref.read(sharedUtilityProvider).isDarkModeEnabled();
  return ThemeNotifier(defaultDarkModeValue: _isDarkMode);
});
