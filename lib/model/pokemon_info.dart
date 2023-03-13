class PokemonInfo{
  final String name;
  final int id;
  final String? frontDefault;
  final String? miniFrontDefault;
  final List<String> types;

  PokemonInfo(this.name, this.id, this.frontDefault, this.miniFrontDefault, this.types);

  @override
  String toString() {
    return " name -> $name, order -> $id, frontDefault -> $frontDefault, miniFrontDefault -> $miniFrontDefault, types -> $types";
  }
}