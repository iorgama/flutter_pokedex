import 'package:pokedex/constants/api_urls.dart';

class Pokemon {
  final String? id;
  final String name;
  final String url;

  Pokemon({
    this.id,
    required this.name,
    required this.url,
  });

  Pokemon.fromJson(Map<String, dynamic> data)
      : id = data['url'].split('/')[6],
        name = data['name'],
        url = ApiConstants.pokemonsImageEndpoint
            .replaceFirst('[pokemonNumber]', data['url'].split('/')[6]);
}
