import 'package:flutter/material.dart';
import 'package:poke_app/constants/constants.dart';
import 'package:poke_app/builder_components/builder_intructions.dart';
import 'package:poke_app/builder_components/container_auto.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {

    final pixelSize = MediaQuery.of(context).size.width / Constants.pixelRatio;

    return ContainerAuto(
      width: 72, 
      height: 12, 
      instructions: [
        [BuilderInstructions(width: 72, color: const Color(0XFFFA5353))],
        [BuilderInstructions(width: 72, height: 8,color: const Color(0XFFE12F34))],
        [BuilderInstructions(width: 72, color: const Color(0XFF930000))],
        [BuilderInstructions(width: 72, color: const Color(0XFF440000))],
        [BuilderInstructions(width: 72, color: Colors.black)],
      ]
    );
  }
}