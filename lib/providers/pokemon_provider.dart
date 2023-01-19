import 'package:flutter/cupertino.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/services/pokemon_api.dart';

class PokemonProvider with ChangeNotifier {
  PokemonProvider(this._pokemonService);

  // The API service
  final PokemonService _pokemonService;

  // Providers values
  List<Pokemon> _pokemons = [];
  List<Pokemon> get pokemons => _pokemons;

  // Provider methods
  Future<void> getPokemons({int limit = 10}) async {
    try {
      final data = await _pokemonService.getPokemons(
        limit: limit,
        offset: _pokemons.length,
      );
      _pokemons = _pokemons..addAll(data.results);
      notifyListeners();
    } catch (e) {
      // todo: Handle error response
      debugPrint(e.toString());
    }
  }
}
