import 'package:flutter/material.dart';
import 'package:poke_app/constants/constants.dart';
import 'package:poke_app/builder_components/builder_intructions.dart';
import 'package:poke_app/builder_components/container_auto.dart';
import 'package:poke_app/components/image_component.dart';
import 'package:poke_app/components/pokemon_card_info.dart';
import 'package:poke_app/model/pokemon.dart';

class PokemonImageCard extends StatelessWidget {

  const PokemonImageCard({
    super.key, 
    required this.pokemon
  });

  final Pokemon? pokemon;

  @override
  Widget build(BuildContext context) {
    final pixelSize = MediaQuery.of(context).size.width / Constants.pixelRatio;
    return Padding(
      padding: EdgeInsets.only(
        top: pixelSize * 3,
        left: pixelSize * 2
      ),
      child: Stack(
        children: [
          ContainerAuto(
            width: 28, 
            height: 28, 
            instructions: [
              [
                BuilderInstructions(),
                BuilderInstructions(width: 26,color: Colors.black),
                BuilderInstructions()
              ],
              [
                BuilderInstructions(color: Colors.black),
                BuilderInstructions(width: 26,color: const Color(0XFFAEAEAE)),
                BuilderInstructions(color: Colors.black)
              ],
              [
                BuilderInstructions(height: 22, color: Colors.black),
                BuilderInstructions(height: 22, width: 26,color: const Color(0XFFAEAEAE)),
                BuilderInstructions(height: 22, color: Colors.black)
              ],
              [
                BuilderInstructions(color: Colors.black),
                BuilderInstructions(width: 26,color: const Color(0XFF8E8E8E)),
                BuilderInstructions(color: Colors.black)
              ],
              [
                BuilderInstructions(color: Colors.black),
                BuilderInstructions(width: 26,color: const Color(0XFF2b2b2b)),
                BuilderInstructions(color: Colors.black)
              ],
              [
                BuilderInstructions(),
                BuilderInstructions(width: 26,color: Colors.black),
                BuilderInstructions()
              ]
            ]
          ),
          Container(
            margin: EdgeInsets.only(left: pixelSize * 1),
            width: 26 * pixelSize, 
            height: 26 * pixelSize, 
            // color: Colors.amber,
            child: ImageComponent(pokemon: pokemon!)
          ),
        ],
      ),
    );
  }
}