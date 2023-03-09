import 'dart:convert';

import 'package:app_desktop/dto/response_get_pokemons_dto.dart';
import 'package:app_desktop/model/simple_pokemon_info.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  Future<ResponseGetPokemonsDto> getPokemons() async {
    final result = await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon/"));

    final json = jsonDecode(result.body);

    List<dynamic> pokesJson = json["results"];

    return ResponseGetPokemonsDto(json['count'], json['next'], json['previous'], pokesJson.map((info) => SimplePokemonInfo(info['name'], info['url'])).toList());
  }
}
