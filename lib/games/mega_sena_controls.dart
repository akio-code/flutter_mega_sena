import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mega_sena/constants/mega_sena_constants.dart';
import 'package:flutter_mega_sena/games/mega_sena_game_notifier.dart';
import 'package:provider/provider.dart';

class _MegaSenaControl extends StatelessWidget {
  final IconData icon;
  final Function action;

  _MegaSenaControl({
    @required this.icon,
    @required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: const ShapeDecoration(
        color: Colors.grey,
        shape: CircleBorder(),
      ),
      child: IconButton(
        icon: Icon(icon),
        color: Colors.black,
        onPressed: action,
      ),
    );
  }
}

class MegaSenaControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (
        BuildContext context,
        MegaSenaGameNotifier notifier,
        Widget child,
      ) {
        bool enableAddNumber =
            notifier.luckyNumbers.length < MegaSenaConstants.MAX_LUCKY_NUMBERS;

        // bool enableSaveGame =
        //     notifier.luckyNumbers.length > MegaSenaConstants.MIN_LUCKY_NUMBERS;

        return Row(
          children: [
            _MegaSenaControl(
              icon: Icons.add,
              action: enableAddNumber ? notifier.generateLuckyNumber : null,
            ),
            SizedBox(width: 5.0),
            _MegaSenaControl(
              icon: Icons.clear,
              action: notifier.clearLuckyNumbers,
            ),
            SizedBox(width: 5.0),
            // _MegaSenaControl(
            //   icon: Icons.download_sharp,
            //   action: enableSaveGame ? notifier.saveLuckyNumbers : null,
            // ),
          ],
        );
      },
    );
  }
}
