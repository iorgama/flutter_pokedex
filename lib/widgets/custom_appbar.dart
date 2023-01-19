import 'package:flutter/material.dart';
import 'package:pokedex/providers/theme_provider.dart';
import 'package:pokedex/resources/images.dart';
import 'package:pokedex/resources/sizes.dart';
import 'package:pokedex/resources/strings.dart';
import 'package:pokedex/resources/text_theme.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.pokeball,
            fit: BoxFit.contain,
            height: Spacing.medium,
          ),
          const SizedBox(
            width: Spacing.small,
          ),
          const Text(
            Strings.appName,
            style: kTextThemeAppBar,
          ),
        ],
      ),
      actions: [
        Switch(
          value:
              context.read<ThemeProvider>().currentThemeMode == ThemeMode.dark,
          activeColor: theme.primaryColor,
          inactiveTrackColor: theme.backgroundColor,
          onChanged: (value) {
            context.read<ThemeProvider>().setTheme(
                  value ? ThemeMode.dark : ThemeMode.light,
                );
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
