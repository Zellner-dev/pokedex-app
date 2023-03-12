import 'package:flutter/material.dart';
import 'package:poke_app/model/pokemon.dart';

class ImageComponent extends StatefulWidget {
  const ImageComponent({
    super.key, 
    required this.pokemon
  });

  final Pokemon pokemon;

  @override
  State<ImageComponent> createState() => _ImageComponentState();
}

class _ImageComponentState extends State<ImageComponent> {

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getPokeInfo();
  }

  Future<void> getPokeInfo() async {
    await widget.pokemon.getPokeInfo();
    if(mounted){
      setState(() {
        isLoading = false;
      });
    }
  }

  String getIndex() {
    String index = widget.pokemon.url;
    index = index.replaceAllMapped("https://pokeapi.co/api/v2/pokemon/", (match) => "");
    index = index.replaceAllMapped("/", (match) => "");
    return index;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
    ? const Center(
      child: CircularProgressIndicator(),
    )
    : Image.network(  
      widget.pokemon.urlImage!,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.none,
    );
  }
}
