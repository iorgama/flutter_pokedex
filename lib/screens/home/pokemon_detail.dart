import 'package:flutter/material.dart';
import 'package:pokedex/providers/pokemon_detail_provider.dart';
import 'package:pokedex/resources/colors.dart';
import 'package:pokedex/widgets/custom_appbar.dart';
import 'package:pokedex/widgets/loading.dart';
import 'package:provider/provider.dart';

class PokemonScreen extends StatefulWidget {
  final String pokemonId;
  const PokemonScreen({
    super.key,
    required this.pokemonId,
  });

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: FutureBuilder(
        future: context
            .read<PokemonDetailProvider>()
            .getPokemon(pokemonId: widget.pokemonId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          }
          return Consumer<PokemonDetailProvider>(
            builder: (context, value, child) {
              final pokemon = context.read<PokemonDetailProvider>().pokemon;
              return Center(
                child: Container(
                  width: 700,
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  color: AppColors.poison,
                  child: Column(
                    children: [
                      Text(pokemon.name),
                      ...pokemon.types.map((type) => Text(type.type.name)),
                    ],
                  ),

                  // child: Column(
                  //   children: [
                  //     Text(pokemon.name),
                  //     ...pokemon.types.map((type) => Text(type.type.name)),
                  //   ],
                  // ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
