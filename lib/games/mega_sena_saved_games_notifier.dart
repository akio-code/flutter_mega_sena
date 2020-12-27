import 'package:flutter/material.dart';
import 'package:flutter_mega_sena/constants/mega_sena_models.dart';

class MegaSenaSavedGamesNotifier extends ChangeNotifier {
  List<MegaSenaSavedGameModel> _savedGames = [];

  List<MegaSenaSavedGameModel> get savedGames => _savedGames;

  void saveGame(MegaSenaSavedGameModel game) {
    game.luckyNumbers.sort();
    _savedGames.add(game);
    notifyListeners();
  }

  void removeSavedGame(int index) {
    _savedGames.removeAt(index);
    notifyListeners();
  }

  void clearSavedGames() {
    _savedGames.clear();
    notifyListeners();
  }
}
