import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:watch_me/presentation/configurations/theme/theme_provider.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  final bool showThemeIcon;
  final bool isShowSearch;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showThemeIcon = false,
    this.isShowSearch = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final themeMode = ref.watch(themeProvider);

    return AppBar(
      title: Text(title, style: TextStyle(color: theme.appBarTheme.foregroundColor)),
      backgroundColor: theme.appBarTheme.backgroundColor,
      iconTheme: theme.appBarTheme.iconTheme,
      actions: [
        if (isShowSearch)
          IconButton(
            icon: Icon(Icons.search, color: theme.appBarTheme.iconTheme?.color),
            onPressed: () {
              context.push('/search');
            },
          ),
        if (showThemeIcon)
          IconButton(
            icon: Icon(
              theme.brightness == Brightness.dark ? Icons.light_mode : Icons.dark_mode,
              color: theme.appBarTheme.iconTheme?.color,
            ),
            onPressed: () {
              if (themeMode == ThemeMode.dark) {
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
