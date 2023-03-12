import 'package:flutter/material.dart';
import 'package:poke_app/constants/constants.dart';

class PokemonCardInfo extends StatelessWidget {

  const PokemonCardInfo({
    super.key, 
    required this.height, 
    required this.name, 
    required this.type
  });

  final double height;
  final String name;
  final String type;

  @override
  Widget build(BuildContext context) {

    final pixelSize = MediaQuery.of(context).size.width / Constants.pixelRatio;

    return Container(
      height: height,
      margin: EdgeInsets.only(
        top: pixelSize * 3,
        left: pixelSize * 2
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25
            ),
          ),
          const Text(
            "Type:",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25
            ),
          )
        ],
      ),
    );
  }
}