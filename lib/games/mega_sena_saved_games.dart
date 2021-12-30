import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mega_sena/games/mega_sena_saved_games_notifier.dart';
import 'package:flutter_mega_sena/shared/mega_sena_control.dart';
import 'package:flutter_mega_sena/shared/mega_sena_number.dart';
import 'package:provider/provider.dart';

class _SavedGameLuckyNumbers extends StatelessWidget {
  final double circleSize = 35.0;
  final List<int> luckyNumbers;

  _SavedGameLuckyNumbers(this.luckyNumbers);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: luckyNumbers.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 25.0,
          child: MegaSenaBoardNumber(gameNumber: luckyNumbers[index]),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 10.0,
        );
      },
    );
  }
}

class MegaSenaSavedGames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (
        BuildContext context,
        MegaSenaSavedGamesNotifier notifier,
        Widget child,
      ) {
        return Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: MegaSenaControl(
                icon: Icons.refresh,
                action: notifier.savedGames.length > 0
                    ? notifier.clearSavedGames
                    : null,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: notifier.savedGames.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 15.0,
                          ),
                          child: _SavedGameLuckyNumbers(
                            notifier.savedGames[index].luckyNumbers,
                          ),
                        ),
                      ),
                      Container(
                        child: MegaSenaControl(
                          icon: Icons.clear,
                          action: () => notifier.removeSavedGame(index),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
