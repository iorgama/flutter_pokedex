import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/resources/colors.dart';

class PokedexTheme {
  PokedexTheme._();

  static final light = ThemeData(
    brightness: Brightness.light,
    backgroundColor: AppColors.backgroundColor,
    appBarTheme: const AppBarTheme(
      color: AppColors.appBarColor,
      elevation: 0,
      foregroundColor: AppColors.titleAppBarColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.appBarColor,
      ),
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      color: AppColors.appBarColor,
      elevation: 0,
      foregroundColor: AppColors.titleAppBarColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.appBarColor,
      ),
    ),
  );
}
