import 'package:pokedex/models/pokemon.dart';

class PokemonListResponse {
  final int count;
  final List<Pokemon> results;

  PokemonListResponse(this.count, this.results);

  PokemonListResponse.fromJson(Map<String, dynamic> data)
      : count = data['count'],
        results = List<Pokemon>.from(
          data['results'].map(
            (e) => Pokemon.fromJson(e),
          ),
        );
}
