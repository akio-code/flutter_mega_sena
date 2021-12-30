import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mega_sena/games/mega_sena_game.dart';
import 'package:flutter_mega_sena/games/mega_sena_game_notifier.dart';
import 'package:flutter_mega_sena/games/mega_sena_saved_games.dart';
import 'package:flutter_mega_sena/games/mega_sena_saved_games_notifier.dart';
import 'package:provider/provider.dart';

class MegaSenaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Icon(
          Icons.verified,
          color: Colors.white,
        ),
      ),
      backgroundColor: Color.fromRGBO(255, 253, 245, 1.0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => MegaSenaGameNotifier(),
              ),
              ChangeNotifierProvider(
                create: (_) => MegaSenaSavedGamesNotifier(),
              ),
            ],
            child: Column(
              children: [
                MegaSenaGame(),
                MegaSenaSavedGames(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
