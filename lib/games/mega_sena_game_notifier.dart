import 'package:flutter/cupertino.dart';
import 'package:flutter_mega_sena/constants/mega_sena_constants.dart';
import 'package:flutter_mega_sena/utils/lucky_numbers.dart';

class MegaSenaGameNotifier extends ChangeNotifier {
  List<int> _luckyNumbers = [];

  List<int> get luckyNumbers => _luckyNumbers;
  double get gamePrice => _gameValue();

  double _gameValue() {
    int totalNumbers = _luckyNumbers.length;
    if (totalNumbers == 6) return MegaSenaConstants.PRICE_6_NUMBERS;
    if (totalNumbers == 7) return MegaSenaConstants.PRICE_7_NUMBERS;
    if (totalNumbers == 8) return MegaSenaConstants.PRICE_8_NUMBERS;
    if (totalNumbers == 9) return MegaSenaConstants.PRICE_9_NUMBERS;
    if (totalNumbers == 10) return MegaSenaConstants.PRICE_10_NUMBERS;
    if (totalNumbers == 11) return MegaSenaConstants.PRICE_11_NUMBERS;
    if (totalNumbers == 12) return MegaSenaConstants.PRICE_12_NUMBERS;
    if (totalNumbers == 13) return MegaSenaConstants.PRICE_13_NUMBERS;
    if (totalNumbers == 14) return MegaSenaConstants.PRICE_14_NUMBERS;
    if (totalNumbers == 14) return MegaSenaConstants.PRICE_14_NUMBERS;
    if (totalNumbers == 15) return MegaSenaConstants.PRICE_15_NUMBERS;
    return 0;
  }

  int _generateLuckyNumber() => LuckyNumbersUtils.generate(
      _luckyNumbers, MegaSenaConstants.BOARD_NUMBERS);

  void addLuckyNumber(int luckyNumber) {
    if (_luckyNumbers.length < MegaSenaConstants.MAX_LUCKY_NUMBERS) {
      _luckyNumbers.add(luckyNumber);
      notifyListeners();
    }
  }

  void generateLuckyNumber() {
    int luckyNumber = _generateLuckyNumber();
    _luckyNumbers.add(luckyNumber);
    notifyListeners();
  }

  void removeLuckyNumber(int index) {
    _luckyNumbers.remove(index);
    notifyListeners();
  }

  void clearLuckyNumbers() {
    _luckyNumbers.clear();
    notifyListeners();
  }
}
