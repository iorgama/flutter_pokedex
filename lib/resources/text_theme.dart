import 'package:flutter/material.dart';
import 'package:pokedex/resources/colors.dart';
import 'package:pokedex/resources/sizes.dart';

const kTextThemeAppBar =
    TextStyle(fontSize: Spacing.medium, fontWeight: FontWeight.w500);
const kTextIdPokemon = TextStyle(
    fontSize: Spacing.small,
    fontWeight: FontWeight.w700,
    height: 2,
    color: AppColors.idCardColor);
final kTextNamePokemon = TextStyle(
    fontSize: Spacing.medium,
    fontWeight: FontWeight.w700,
    color: AppColors.nameCardColor.withOpacity(0.5));
