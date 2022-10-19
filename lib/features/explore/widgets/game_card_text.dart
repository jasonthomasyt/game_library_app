import 'package:flutter/material.dart';
import 'package:game_library_app/extensions/build_context_extensions.dart';
import 'package:game_library_app/state_management/providers/theme_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GameCardText extends ConsumerWidget {
  const GameCardText({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkModeEnabled = ref.watch(themeStateProvider);

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: (isDarkModeEnabled ? Colors.black : Colors.white)
              .withOpacity(0.5),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
        ),
        child: Text(
          title,
          style: context.isMobile
              ? Theme.of(context).textTheme.bodyLarge
              : Theme.of(context).textTheme.headline5,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
