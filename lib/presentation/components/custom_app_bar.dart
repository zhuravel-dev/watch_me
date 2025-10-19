import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_me/presentation/configurations/theme/theme_provider.dart';
import 'package:watch_me/presentation/configurations/theme/theme.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  final bool showThemeIcon;

  const CustomAppBar({super.key, required this.title, this.showThemeIcon = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    final brightness = themeMode == ThemeMode.system
        ? MediaQuery.of(context).platformBrightness
        : (themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light);

    final backgroundColor = brightness == Brightness.dark
        ? DarkColors.primary
        : LightColors.primary;
    final foregroundColor = brightness == Brightness.dark ? DarkColors.text : LightColors.text;
    final iconColor = foregroundColor;

    return AppBar(
      title: Text(title, style: TextStyle(color: foregroundColor)),
      backgroundColor: backgroundColor,
      iconTheme: IconThemeData(color: iconColor),
      actions: [
        if (showThemeIcon)
          IconButton(
            icon: Icon(
              brightness == Brightness.dark ? Icons.light_mode : Icons.dark_mode,
              color: iconColor,
            ),
            onPressed: () {
              if (brightness == Brightness.dark) {
                ref.read(themeProvider.notifier).setLight();
              } else {
                ref.read(themeProvider.notifier).setDark();
              }
            },
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
