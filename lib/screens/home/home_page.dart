import 'package:flutter/material.dart';
import 'package:pokedex/providers/pokemon_provider.dart';
import 'package:pokedex/providers/theme_provider.dart';
import 'package:pokedex/widgets/custom_appbar.dart';
import 'package:pokedex/widgets/loading.dart';
import 'package:pokedex/widgets/pokemon_card.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  @override
  initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<PokemonProvider>().getPokemons();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: FutureBuilder(
          future: context.read<PokemonProvider>().getPokemons(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loading();
            }
            return Consumer<PokemonProvider>(
              builder: (context, value, child) => ListView.builder(
                controller: _scrollController,
                itemBuilder: (context, index) {
                  final pokemonList = context.read<PokemonProvider>().pokemons;
                  return PokemonCard(
                    pokemon: pokemonList[index],
                  );
                },
                itemCount: context.read<PokemonProvider>().pokemons.length,
              ),
            );
          },
        ));
  }
}
