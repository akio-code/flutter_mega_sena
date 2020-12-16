import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mega_sena/constants/mega_sena_constants.dart';
import 'package:flutter_mega_sena/games/mega_sena_game_notifier.dart';
import 'package:provider/provider.dart';

class _MegaSenaNumber extends StatelessWidget {
  final int gameNumber;
  final bool luckyNumber;

  _MegaSenaNumber({
    @required this.gameNumber,
    @required this.luckyNumber,
  });

  @override
  Widget build(BuildContext context) {
    const numberColor = Colors.red;
    const numberBorderSide = BorderSide(color: numberColor);
    const luckyNumberColor = Colors.black87;

    return Stack(
      children: [
        Row(
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
        ),
        if (luckyNumber)
          Container(
            color: luckyNumberColor,
            margin: const EdgeInsets.all(2.0),
          ),
      ],
    );
  }
}

class MegaSenaBoardNumbers extends StatelessWidget {
  // final List<int> luckyNumbers;

  // MegaSenaBoardNumbers({@required this.luckyNumbers});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.cyan,
      // alignment: Alignmentnment.center,
      child: Consumer(
        builder: (
          BuildContext context,
          MegaSenaGameNotifier notifier,
          Widget child,
        ) {
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MegaSenaConstants.BOARD_NUMBERS_ROW,
              childAspectRatio: 1.35,
            ),
            itemCount: MegaSenaConstants.BOARD_NUMBERS,
            itemBuilder: (BuildContext context, int index) {
              int gameNumber = index + 1;
              return GestureDetector(
                onTap: notifier.luckyNumbers.contains(gameNumber)
                    ? () => notifier.removeLuckyNumber(gameNumber)
                    : () => notifier.addLuckyNumber(gameNumber),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: _MegaSenaNumber(
                    gameNumber: gameNumber,
                    luckyNumber: notifier.luckyNumbers.contains(gameNumber),
                  ),
                ),
              );
            },
          );
        },
        // child: GridView.builder(
        //   shrinkWrap: true,
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: MegaSenaConstants.BOARD_NUMBERS_ROW,
        //     childAspectRatio: 1.35,
        //   ),
        //   itemCount: MegaSenaConstants.BOARD_NUMBERS,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Padding(
        //       padding: const EdgeInsets.all(5.0),
        //       child: GestureDetector(
        //         onTap: luckyNumbers.contains(index + 1) ? null : () {},
        //         child: _MegaSenaNumber(
        //           gameNumber: index + 1,
        //           luckyNumber: luckyNumbers.contains(index + 1),
        //         ),
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}
