import 'package:flutter/material.dart';
import 'package:poke_app/constants/constants.dart';
import 'package:poke_app/components/custom_appbar.dart';
import 'package:poke_app/components/custom_bottom_bar.dart';
import 'package:poke_app/components/pokemon_card.dart';
import 'package:poke_app/model/pokemon_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isLoading = true;


  @override
  void initState() {
    super.initState();
    getPokemons();
  }



  Future<void> getPokemons() async {
    await Future.delayed(const Duration(seconds: 1));
    // ignore: use_build_context_synchronously
    await Provider.of<PokemonList>(context, listen: false).getPokemons();
    setState(() {
      isLoading = false;
    });
  }



  @override
  Widget build(BuildContext context) {

    final pokeProvider = Provider.of<PokemonList>(context);
    final pixelSize = MediaQuery.of(context).size.width / Constants.pixelRatio;
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: CustomAppBar(pixelSize: pixelSize).appbar,
      body: isLoading
      ? const Center(
        child: CircularProgressIndicator()
      )
      : ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: pokeProvider.listLength,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: index == 0 ? pixelSize * 2 : 0),
            child: PokemonCard(
              pokemon: pokeProvider.pokemons[index],
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomBottomBar()
    //   isLoading
    //   ? const Center(
    //     child: CircularProgressIndicator()
    //   )
    //   : ListView.builder(
    //     itemCount: pokeProvider.listLength,
    //     itemBuilder: (context, index) {
    //       return PokemonCard(
    //         pokemon: pokeProvider.pokemons[index],
    //       );
    //     },
      
    );
  }
}
