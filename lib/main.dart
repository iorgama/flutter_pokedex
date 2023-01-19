import 'package:flutter/material.dart';
import 'package:pokedex/providers/pokemon_provider.dart';
import 'package:pokedex/providers/theme_provider.dart';
import 'package:pokedex/screens/home/home_page.dart';
import 'package:pokedex/resources/strings.dart';
import 'package:pokedex/resources/theme.dart';
import 'package:pokedex/services/pokemon_api.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Pokedex());
}

class Pokedex extends StatefulWidget {
  const Pokedex({super.key});

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  @override
  Widget build(BuildContext context) {
    // Similar a Context API do React
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Provider<PokemonService>(
        create: (_) => PokemonServiceImpl(),
        child: ChangeNotifierProvider(
          create: (context) => PokemonProvider(
            context.read<PokemonService>(),
          ),
          child: Consumer<ThemeProvider>(
            builder: (context, value, child) => MaterialApp(
              title: Strings.appName,
              themeMode: context.read<ThemeProvider>().currentThemeMode,
              theme: PokedexTheme.light,
              darkTheme: PokedexTheme.dark,
              home: const Home(),
            ),
          ),
        ),
      ),
    );
  }
}
