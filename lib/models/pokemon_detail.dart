class PokemonDetail {
  final int height;
  final int id;
  final String name;
  final List<Type> types;
  final int weight;

  PokemonDetail({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.types,
  });

  PokemonDetail.fromJson(Map<String, dynamic> data)
      : weight = data["weight"],
        id = data["id"],
        name = data["name"],
        height = data["height"],
        types = List<Type>.from(data["types"].map((x) {
          return Type.fromJson(x);
        }));
}

class Species {
  final String name;
  final String url;

  Species({
    required this.name,
    required this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) {
    return Species(
      name: json["name"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Type {
  final int slot;
  final Species type;

  Type({
    required this.slot,
    required this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      slot: json["slot"],
      type: Species.fromJson(json["type"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
      };
}
