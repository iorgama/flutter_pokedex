import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/providers/pokemon_detail_provider.dart';
import 'package:pokedex/resources/colors.dart';
import 'package:pokedex/resources/sizes.dart';
import 'package:pokedex/resources/text_theme.dart';
import 'package:pokedex/screens/home/pokemon_detail.dart';
import 'package:pokedex/services/pokemon_api.dart';
import 'package:provider/provider.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (context) => PokemonDetailProvider(
                context.read<PokemonService>(),
              ),
              child: PokemonScreen(
                pokemonId: pokemon.id!,
              ),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(Spacing.extraSmall),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundCard,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          // ignore: sort_child_properties_last
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('#00${pokemon.id}', style: kTextIdPokemon),
                    Text(
                        "${pokemon.name[0].toUpperCase()}${pokemon.name.substring(1)}",
                        style: kTextNamePokemon),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: SizedBox(
                    height: 160,
                    child: CachedNetworkImage(
                      imageUrl: pokemon.url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          height: 180,
        ),
      ),
    );
  }
}
