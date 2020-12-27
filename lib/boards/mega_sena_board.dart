import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mega_sena/constants/mega_sena_constants.dart';
import 'package:flutter_mega_sena/games/mega_sena_game_notifier.dart';
import 'package:flutter_mega_sena/shared/mega_sena_number.dart';
import 'package:provider/provider.dart';

class _MegaSenaBoardNumber extends StatelessWidget {
  final int gameNumber;
  final bool luckyNumber;

  _MegaSenaBoardNumber({
    @required this.gameNumber,
    @required this.luckyNumber,
  });

  @override
  Widget build(BuildContext context) {
    const luckyNumberColor = Colors.black87;

    return Stack(
      children: [
        MegaSenaBoardNumber(gameNumber: gameNumber),
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
  @override
  Widget build(BuildContext context) {
    return Consumer(
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
                child: _MegaSenaBoardNumber(
                  gameNumber: gameNumber,
                  luckyNumber: notifier.luckyNumbers.contains(gameNumber),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
