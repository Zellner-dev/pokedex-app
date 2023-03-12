import 'package:flutter/material.dart';
import 'package:poke_app/builder_components/builder_intructions.dart';
import 'package:poke_app/builder_components/container_auto.dart';

class CustomAppBar {
  double pixelSize;

  CustomAppBar({
    required this.pixelSize
  }); 
  
  PreferredSize get appbar => PreferredSize(
    preferredSize: Size(pixelSize * 72, pixelSize * 15 ),
    child: SizedBox(
      height: 15 * pixelSize,
      width: 72 * pixelSize,
      child: Stack(
        children: [
          ContainerAuto(
            height: 15,
            width: 72,
            instructions: [
              [BuilderInstructions(width: 72, height: 3, color: const Color(0XFFFA5353))],
              [BuilderInstructions(width: 72, height: 9, color: const Color(0XFFE12F34))],
              [BuilderInstructions(width: 72, color: const Color(0XFF8A0505))],
              [BuilderInstructions(width: 72, color: const Color(0XFF650202))],
              [BuilderInstructions(width: 72, color: Colors.black)],
            ],
          ),
          Container(
            height: 15 * pixelSize,
            margin: EdgeInsets.only(
              top: pixelSize * 3.5,
              left: pixelSize * 2
            ),
            child: const Text(
              "PokeApp",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white
              ),
            ),
          ),
          
        ],
      ),
    )
  );

  void prinx() {
    print(appbar.preferredSize.height);
  }
}