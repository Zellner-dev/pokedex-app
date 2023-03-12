
import 'package:flutter/material.dart';
import 'package:poke_app/components/pokemon_card_info.dart';
import 'package:poke_app/constants/constants.dart';
import 'package:poke_app/builder_components/builder_intructions.dart';
import 'package:poke_app/builder_components/container_auto.dart';
import 'package:poke_app/components/pokemon_image_card.dart';
import 'package:poke_app/model/pokemon.dart';

class PokemonCard extends StatelessWidget {

  const PokemonCard({
    super.key, 
    required this.pokemon
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {

    final pixelSize = MediaQuery.of(context).size.width / Constants.pixelRatio;

    return Padding(
      padding: EdgeInsets.only(
        left: pixelSize * 2, 
        right: pixelSize * 2, 
        bottom: pixelSize * 2
      ),
      child: Stack(
        children: [
          ContainerAuto(
            width: 68, 
            height: 34,
            instructions: [
              [
                BuilderInstructions(),
                BuilderInstructions(
                  width: 66, 
                  color: Colors.black
                ),
                BuilderInstructions(),
              ],
              [
                BuilderInstructions(
                  color: Colors.black
                ),
                BuilderInstructions(
                  width: 66, 
                  color: const Color(0XFF6D6D6D)
                ),
                BuilderInstructions(
                  color: Colors.black
                ),
              ],
              [
                BuilderInstructions(
                  height: 29,
                  color: Colors.black
                ),
                BuilderInstructions(
                  height: 29,
                  width: 66, 
                  color: const Color(0XFF545454)
                ),
                BuilderInstructions(
                  height: 29,
                  color: Colors.black
                ),
              ],
              [
                BuilderInstructions(color: Colors.black),
                BuilderInstructions(
                  width: 66, 
                  color: const Color(0XFF323232)
                ),
                BuilderInstructions(color: Colors.black),
              ],
              [
                BuilderInstructions(color: Colors.black),
                BuilderInstructions(
                  width: 66, 
                  color: const Color(0XFF2B2B2B)
                ),
                BuilderInstructions(color: Colors.black)
              ],
              [
                BuilderInstructions(),
                BuilderInstructions(
                  width: 66, 
                  color: Colors.black
                ),
                BuilderInstructions(),
              ],
            ], 
          ),
          Row(
            children: [
              PokemonImageCard(pokemon: pokemon),
              PokemonCardInfo(
                height: pixelSize * 28, 
                name: pokemon.name, 
                type: " "
              )
            ],
          )
        ],
      ),
    );
  }
}