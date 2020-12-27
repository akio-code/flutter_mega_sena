import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MegaSenaBoardNumber extends StatelessWidget {
  final int gameNumber;

  MegaSenaBoardNumber({
    @required this.gameNumber,
  });

  @override
  Widget build(BuildContext context) {
    const numberColor = Colors.red;
    const numberBorderSide = BorderSide(color: numberColor);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 5,
          decoration: const BoxDecoration(
            border: const Border(
              top: numberBorderSide,
              bottom: numberBorderSide,
              left: numberBorderSide,
            ),
          ),
        ),
        Text(
          gameNumber.toString().padLeft(2, '0'),
          style: const TextStyle(
            color: numberColor,
            height: 1.0,
          ),
        ),
        Container(
          width: 5,
          decoration: const BoxDecoration(
            border: const Border(
              top: numberBorderSide,
              bottom: numberBorderSide,
              right: numberBorderSide,
            ),
          ),
        ),
      ],
    );
  }
}
