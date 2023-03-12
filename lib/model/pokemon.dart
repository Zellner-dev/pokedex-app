import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:poke_app/constants/constants.dart';

class Pokemon {
  String name;
  String url;
  String? urlImage;

  Future<void> getPokeInfo() async {
    final response = await http.get(Uri.parse(url));
    final body = jsonDecode(response.body);
    
    fromJson(body);
  }

  Pokemon({
    required this.name,
    required this.url,
    this.urlImage
  });

  String getIndex() {
    String index = url;
    index = index.replaceAllMapped("${Constants.apiUrl}/pokemon/", (match) => "");
    index = index.replaceAllMapped("/", (match) => "");
    return index;
  }
  
  fromJson(dynamic json){

    String? frontDefault = json["sprites"]["front_default"];
    String? officilArtwork = json["sprites"]["other"]["official-artwork"]["front_default"];
    String? home = json["sprites"]["other"]["home"]["front_default"];

    late String existingUrlImage;
    if(frontDefault != null){
      existingUrlImage = frontDefault;
    } else if(officilArtwork != null) {
      existingUrlImage = officilArtwork;
    } else {
      existingUrlImage = home!;
    }

    urlImage = existingUrlImage;
  }
}