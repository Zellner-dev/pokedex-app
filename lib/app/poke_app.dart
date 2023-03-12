
import 'package:flutter/material.dart';
import 'package:poke_app/app/app_routes.dart';
import 'package:poke_app/model/pokemon_list.dart';
import 'package:poke_app/pages/home_page.dart';
import 'package:provider/provider.dart';

class PokeApp extends StatelessWidget {
  const PokeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => PokemonList()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "ThaleahFat",
          colorScheme: Theme.of(context).colorScheme.copyWith(
            background: const Color(0XFF404040),
            primary: const Color(0XFFc92e2e)
          )
        ),
        routes: {
          AppRoutes.home : (context) => const HomePage()
        },
      ),
    );
  }
}