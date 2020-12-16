import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mega_sena/boards/mega_sena_board.dart';
import 'package:flutter_mega_sena/games/mega_sena_controls.dart';
import 'package:flutter_mega_sena/games/mega_sena_game_notifier.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class _GamePrice extends StatelessWidget {
  final numberFormat = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
  );

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (
        BuildContext context,
        MegaSenaGameNotifier notifier,
        Widget child,
      ) {
        String gamePrice = notifier.gamePrice == 0
            ? '-'
            : numberFormat.format(notifier.gamePrice);
        return Text('valor: $gamePrice');
      },
    );
  }
}

class MegaSenaGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider(
        create: (BuildContext context) => MegaSenaGameNotifier(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MegaSenaBoardNumbers(),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _GamePrice(),
                MegaSenaControls(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
