import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mega_sena/lucky_numbers_notifier.dart';
import 'package:provider/provider.dart';

class LuckyNumbersControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LuckyNumbersNotifier>(
      builder: (
        BuildContext context,
        LuckyNumbersNotifier notifier,
        Widget child,
      ) {
        bool enableAddNumber = notifier.luckyNumbers.length <
            LuckyNumberConstants.MAX_GAME_NUMBERS;

        bool enableSaveGame = notifier.luckyNumbers.length > 0;

        return Row(
          children: [
            Ink(
              decoration: const ShapeDecoration(
                color: Colors.lightBlue,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(Icons.add),
                color: Colors.white,
                onPressed: enableAddNumber ? notifier.addLuckyNumber : null,
              ),
            ),
            SizedBox(width: 5.0),
            Ink(
              decoration: const ShapeDecoration(
                color: Colors.lightBlue,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(Icons.clear),
                color: Colors.white,
                onPressed: notifier.clearLuckyNumbers,
              ),
            ),
            SizedBox(width: 5.0),
            Ink(
              decoration: const ShapeDecoration(
                color: Colors.lightBlue,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(Icons.download_sharp),
                color: Colors.white,
                onPressed: enableSaveGame ? notifier.saveLuckyNumbers : null,
              ),
            ),
          ],
        );
      },
    );
  }
}
