
import 'package:app_desktop/model/simple_pokemon_info.dart';

class ResponseGetPokemonsDto {
  final int count;
  final String? nextUrl;
  final String? previousUrl;
  final List<SimplePokemonInfo> results;

  ResponseGetPokemonsDto(this.count, this.nextUrl, this.previousUrl, this.results);

  @override
  String toString() {
    return 'count -> $count nextUrl -> $nextUrl previousUrl -> $previousUrl results -> $results';
  }
}
