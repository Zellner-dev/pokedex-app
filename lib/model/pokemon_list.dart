import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:poke_app/model/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonList with ChangeNotifier {

  String apiUrl = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=2000";
  
  List<Pokemon> _pokemons = [];

  List<Pokemon> get pokemons {
    return _pokemons;
  }  

  int get listLength {
    return _pokemons.length;
  } 

  Future<void> getPokemons() async {
    
    try {
      final response = await http.get(
        Uri.parse("https://pokeapi.co/api/v2/pokemon?offset=0&limit=200000000")
      );

      final data = jsonDecode(response.body);
      
      List<Pokemon> listFromData = [];

      data["results"].forEach((result) {

        if(getIndex(result["url"]).length < 5  ) {
          listFromData.add(
            Pokemon(
              name: result["name"] ?? " - ", 
              url: result["url"] ?? " - "
            )
          );
        }
        }
      );

      _pokemons = listFromData;

      notifyListeners();
    } on Exception {
      log("Deu erro.");
    }
  }

  String getIndex(String url) {
    String index = url;
    index = index.replaceAllMapped("https://pokeapi.co/api/v2/pokemon/", (match) => "");
    index = index.replaceAllMapped("/", (match) => "");
    return index;
  }
}