import 'package:flutter/cupertino.dart';
import 'package:pokedex/models/pokemon_detail.dart';
import 'package:pokedex/services/pokemon_api.dart';

class PokemonDetailProvider with ChangeNotifier {
  PokemonDetailProvider(this._pokemonService);

  // The API service
  final PokemonService _pokemonService;

  // Providers values
  late PokemonDetail _pokemon;
  PokemonDetail get pokemon => _pokemon;

  // Provider methods
  Future<void> getPokemon({required String pokemonId}) async {
    try {
      final data = await _pokemonService.getPokemon(
        pokemonId: pokemonId,
      );
      _pokemon = data;
      notifyListeners();
    } catch (e) {
      // todo: Handle error response
      debugPrint(e.toString());
    }
  }
}
