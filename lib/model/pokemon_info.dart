class PokemonInfo{
  final String name;
  final int order;
  final String frontDefault;
  final String miniFrontDefault;
  final List<String> types;

  PokemonInfo(this.name, this.order, this.frontDefault, this.miniFrontDefault, this.types);

  @override
  String toString() {
    return " name -> $name, order -> $order, frontDefault -> $frontDefault, miniFrontDefault -> $miniFrontDefault, types -> $types";
  }
}