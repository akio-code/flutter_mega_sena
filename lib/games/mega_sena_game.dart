import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mega_sena/boards/mega_sena_board.dart';
import 'package:flutter_mega_sena/games/mega_sena_controls.dart';
import 'package:flutter_mega_sena/games/mega_sena_game_notifier.dart';
import 'package:flutter_mega_sena/utils/currency_formatter.dart';
import 'package:provider/provider.dart';

class _GamePrice extends StatelessWidget {
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
            : CurrencyFormatter.convert(notifier.gamePrice);
        return Text('$gamePrice');
      },
    );
  }
}

class MegaSenaGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 10.0),
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
    );
  }
}
