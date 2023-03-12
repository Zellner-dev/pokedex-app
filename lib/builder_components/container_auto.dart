import 'package:flutter/cupertino.dart';
import 'package:poke_app/constants/constants.dart';
import 'package:poke_app/builder_components/builder_intructions.dart';

class ContainerAuto extends StatelessWidget {
  const ContainerAuto({
    super.key, 
    required this.width, 
    required this.height,
    required this.instructions, 
  });
  
  final double width;
  final double height;
  final List<List<BuilderInstructions>> instructions;

  @override
  Widget build(BuildContext context) {
    final pixelSize = MediaQuery.of(context).size.width / Constants.pixelRatio;
    double my = height * pixelSize;
    print(my);
    print(pixelSize);
    return SizedBox(
      height: my,
      width: width * pixelSize,
      child: Column(
        children: List.generate(
          instructions.length, (y) => 
            SizedBox(
              width: width * pixelSize,
              // height: pixelSize,
              child: Row(
                children: List.generate(
                  instructions[y].length, (x) => 
                    Container(
                      width: instructions[y][x].width * pixelSize,
                      height: instructions[y][x].height * pixelSize,
                      color: instructions[y][x].color,
                    )
                ),
              )
            )
        ),
      )
    );
  }
}