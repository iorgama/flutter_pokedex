import 'package:dio/dio.dart';
import 'package:pokedex/constants/api_urls.dart';
import 'package:pokedex/models/pokemon_detail.dart';
import 'package:pokedex/models/pokemon_list_response.dart';

abstract class PokemonService {
  Future<PokemonListResponse> getPokemons({
    required int limit,
    required int offset,
  });

  Future<PokemonDetail> getPokemon({
    required String pokemonId,
  });
}

class PokemonServiceImpl implements PokemonService {
  final Dio _client = Dio();

  @override
  Future<PokemonListResponse> getPokemons({
    required int limit,
    required int offset,
  }) async {
    final response = await _client.get(
      ApiConstants.baseUrl + ApiConstants.pokemonsEndpoint,
      queryParameters: {
        "limit": limit,
        "offset": offset,
      },
    );

    return PokemonListResponse.fromJson(response.data);
  }

  @override
  Future<PokemonDetail> getPokemon({
    required String pokemonId,
  }) async {
    final response = await _client.get(
      ApiConstants.baseUrl +
          ApiConstants.pokemonEndpoint
              .replaceFirst('[pokemonNumber]', pokemonId),
    );

    return PokemonDetail.fromJson(response.data);
  }
}
