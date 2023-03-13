import 'dart:convert';

import 'package:app_desktop/dto/response_get_pokemons_dto.dart';
import 'package:app_desktop/model/pokemon_info.dart';
import 'package:app_desktop/model/simple_pokemon_info.dart';
import 'package:http/http.dart' as http;

class HttpClient {

  Future<ResponseGetPokemonsDto> getPokemons(String url) async {
    final result =
        await http.get(Uri.parse(url));

    final json = jsonDecode(result.body);

    List<dynamic> pokesJson = json["results"];

    return ResponseGetPokemonsDto(json['count'],json['next'],json['previous'],pokesJson.map((info) => SimplePokemonInfo(info['name'], info['url'])).toList());
  }

  Future<PokemonInfo> getPokemonInfo(String url) async {
    final result = await http.get(Uri.parse(url));

    final pokeInfo = jsonDecode(result.body);

    List<dynamic> types = pokeInfo["types"];

    List<String> typesName = types.map((type) => type['type']["name"].toString()).toList();

    return PokemonInfo(pokeInfo["name"],pokeInfo["id"],pokeInfo["sprites"]["other"]["dream_world"]["front_default"],pokeInfo["sprites"]["front_default"],typesName);
  }

  Future<List<PokemonInfo>> getListPokemonInfo(List<String> urls) async {
    List<PokemonInfo> list = [];

    for (var url in urls) {
      final result = await http.get(Uri.parse(url));

      final pokeInfo = jsonDecode(result.body);

      List<dynamic> types = pokeInfo["types"];

      List<String> typesName = types.map((type) => type['type']["name"].toString()).toList();

      list.add(PokemonInfo(pokeInfo["name"],pokeInfo["id"],pokeInfo["sprites"]["other"]["dream_world"]["front_default"],pokeInfo["sprites"]["front_default"],typesName));
    }
    return list;
  }

}
