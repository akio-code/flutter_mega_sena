import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mega_sena/constants/mega_sena_constants.dart';
import 'package:flutter_mega_sena/constants/mega_sena_models.dart';
import 'package:flutter_mega_sena/games/mega_sena_game_notifier.dart';
import 'package:flutter_mega_sena/games/mega_sena_saved_games_notifier.dart';
import 'package:flutter_mega_sena/shared/mega_sena_control.dart';
import 'package:provider/provider.dart';

class MegaSenaControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2(
      builder: (
        BuildContext context,
        MegaSenaGameNotifier notifier,
        MegaSenaSavedGamesNotifier saveNotifier,
        Widget child,
      ) {
        bool enableAddNumber =
            notifier.luckyNumbers.length < MegaSenaConstants.MAX_LUCKY_NUMBERS;

        bool enableSaveGame =
            notifier.luckyNumbers.length >= MegaSenaConstants.MIN_LUCKY_NUMBERS;

        return Row(
          children: [
            MegaSenaControl(
              icon: Icons.add,
              action: enableAddNumber ? notifier.generateLuckyNumber : null,
            ),
            SizedBox(width: 5.0),
            MegaSenaControl(
              icon: Icons.clear,
              action: notifier.luckyNumbers.length > 0
                  ? notifier.clearLuckyNumbers
                  : null,
            ),
            SizedBox(width: 5.0),
            MegaSenaControl(
              icon: Icons.save_alt,
              action: enableSaveGame
                  ? () {
                      saveNotifier.saveGame(
                        new MegaSenaSavedGameModel(
                          new List<int>.from(notifier.luckyNumbers),
                          notifier.gamePrice,
                        ),
                      );
                      notifier.clearLuckyNumbers();
                    }
                  : null,
            ),
          ],
        );
      },
    );
  }
}
