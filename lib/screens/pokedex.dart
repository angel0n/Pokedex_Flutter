// ignore_for_file: avoid_init_to_null

import 'package:app_desktop/components/pokedex_list.dart';
import 'package:app_desktop/http/client_http.dart';
import 'package:flutter/material.dart';

class Pokedex extends StatefulWidget {
  const Pokedex({super.key});

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  late List<String> urls = [""];
  late String? nextUrl = null;
  late String? previousUrl = null;
  late bool isLoading = true;

  @override
  void initState() {
    super.initState();
    HttpClient()
        .getPokemons("https://pokeapi.co/api/v2/pokemon/")
        .then((result) => {
              setState(() {
                urls = result.results.map((poke) => poke.url).toList();
                nextUrl = result.nextUrl;
                previousUrl = result.previousUrl;
                isLoading = false;
              })
            });
  }

  void next() {
    if (nextUrl != null && !isLoading) {
      setState(() {
        isLoading = true;
      });
      HttpClient().getPokemons(nextUrl!).then((result) => {
            setState(() {
              urls = result.results.map((poke) => poke.url).toList();
              nextUrl = result.nextUrl;
              previousUrl = result.previousUrl;
              isLoading = false;
            })
          });
    }
  }

  void previous() {
    if (previousUrl != null && !isLoading) {
      setState(() {
        isLoading = true;
      });
      HttpClient().getPokemons(previousUrl!).then((result) => {
            setState(() {
              urls = result.results.map((poke) => poke.url).toList();
              nextUrl = result.nextUrl;
              previousUrl = result.previousUrl;
              isLoading = false;
            })
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokedex",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.red[700],
        actions: [
          Row(
            children: [
              ElevatedButton(
                onPressed: nextUrl != null ? next : null,
                child: const Text("Next"),
              ),
              ElevatedButton(
                onPressed: previousUrl != null ? previous : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(2.0),
                ),
                child: const Text("Previous"),
              ),
            ],
          )
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListPokedex(urls),
    );
  }
}
