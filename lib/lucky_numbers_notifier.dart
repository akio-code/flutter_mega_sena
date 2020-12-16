import 'dart:collection';
import 'dart:math';

import 'package:flutter/widgets.dart';

@Deprecated('use MegaSenaConstants instead')
class LuckyNumberConstants {
  static const int MIN_LUCKY_NUMBER = 1;
  static const int MAX_LUCKY_NUMBER = 60;
  static const int MAX_GAME_NUMBERS = 15;

  static const double PRICE_6_NUMBERS = 4.50;
  static const double PRICE_7_NUMBERS = 31.50;
  static const double PRICE_8_NUMBERS = 126.00;
  static const double PRICE_9_NUMBERS = 378.50;
  static const double PRICE_10_NUMBERS = 945.00;
  static const double PRICE_11_NUMBERS = 2079.00;
  static const double PRICE_12_NUMBERS = 4158.00;
  static const double PRICE_13_NUMBERS = 7722.00;
  static const double PRICE_14_NUMBERS = 13513.50;
  static const double PRICE_15_NUMBERS = 22522.50;
}

class LuckyNumbersNotifier extends ChangeNotifier {
  List<int> _luckyNumbers = [];
  double gamePrice = 0;
  List<List<int>> _savedLuckyNumbers = [];

  UnmodifiableListView get luckyNumbers => UnmodifiableListView(_luckyNumbers);
  UnmodifiableListView get savedLuckyNumbers =>
      UnmodifiableListView(_savedLuckyNumbers);

  int _generateLuckyNumber() {
    Random luckyFactor = new Random();
    var generatedNumber =
        luckyFactor.nextInt(LuckyNumberConstants.MAX_LUCKY_NUMBER);
    while (generatedNumber == 0 || _luckyNumbers.contains(generatedNumber)) {
      generatedNumber =
          luckyFactor.nextInt(LuckyNumberConstants.MAX_LUCKY_NUMBER);
    }
    return generatedNumber;
  }

  void _updateGameValue() {
    int totalNumbers = _luckyNumbers.length;
    if (totalNumbers < 6) gamePrice = 0;
    if (totalNumbers == 6) gamePrice = LuckyNumberConstants.PRICE_6_NUMBERS;
    if (totalNumbers == 7) gamePrice = LuckyNumberConstants.PRICE_7_NUMBERS;
    if (totalNumbers == 8) gamePrice = LuckyNumberConstants.PRICE_8_NUMBERS;
    if (totalNumbers == 9) gamePrice = LuckyNumberConstants.PRICE_9_NUMBERS;
    if (totalNumbers == 10) gamePrice = LuckyNumberConstants.PRICE_10_NUMBERS;
    if (totalNumbers == 11) gamePrice = LuckyNumberConstants.PRICE_11_NUMBERS;
    if (totalNumbers == 12) gamePrice = LuckyNumberConstants.PRICE_12_NUMBERS;
    if (totalNumbers == 13) gamePrice = LuckyNumberConstants.PRICE_13_NUMBERS;
    if (totalNumbers == 14) gamePrice = LuckyNumberConstants.PRICE_14_NUMBERS;
    if (totalNumbers == 14) gamePrice = LuckyNumberConstants.PRICE_14_NUMBERS;
    if (totalNumbers == 15) gamePrice = LuckyNumberConstants.PRICE_15_NUMBERS;
  }

  void addLuckyNumber() {
    int luckyNumber = _generateLuckyNumber();
    _luckyNumbers.add(luckyNumber);
    _updateGameValue();
    notifyListeners();
  }

  void removeLuckyNumber(int index) {
    _luckyNumbers.removeAt(index);
    _updateGameValue();
    notifyListeners();
  }

  void clearLuckyNumbers() {
    _luckyNumbers.clear();
    notifyListeners();
  }

  void saveLuckyNumbers() {
    _savedLuckyNumbers.add(new List<int>.from(_luckyNumbers));
    _luckyNumbers.clear();
    notifyListeners();
  }

  void removeSavedLuckyNumber(int index) {
    _savedLuckyNumbers.removeAt(index);
    notifyListeners();
  }
}
