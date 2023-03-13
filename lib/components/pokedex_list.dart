import 'package:app_desktop/components/card.dart';
import 'package:app_desktop/http/client_http.dart';
import 'package:app_desktop/model/pokemon_info.dart';
import 'package:flutter/material.dart';

class ListPokedex extends StatelessWidget {
  final List<String> urls;
  
  const ListPokedex(this.urls,{super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
   return FutureBuilder(
        future: HttpClient().getListPokemonInfo(urls),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            final List<PokemonInfo>? pokes = snapshot.data;
            return GridView.builder(

              itemCount: pokes!.length,
              itemBuilder: (context, index) {
                final PokemonInfo poke = pokes[index];
                return Expanded(
                  child: CardInfo(
                      poke.name, poke.id, poke.frontDefault, poke.types),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: size.width~/250,
                mainAxisExtent: 300,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}