class SimplePokemonInfo {
  final String name;
  final String url;

  SimplePokemonInfo(this.name, this.url);

  SimplePokemonInfo.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        url = json["url"];

  @override
  String toString() {
    return 'name -> $name url -> $url';
  }
}
