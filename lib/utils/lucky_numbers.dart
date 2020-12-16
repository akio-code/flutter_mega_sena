import 'dart:math';

class LuckyNumbersUtils {
  static int generate(List<int> chosenNumbers, int maxNumber) {
    Random luckyFactor = new Random();
    var generatedNumber = luckyFactor.nextInt(maxNumber);
    while (generatedNumber == 0 || chosenNumbers.contains(generatedNumber)) {
      generatedNumber = luckyFactor.nextInt(maxNumber);
    }
    return generatedNumber;
  }
}
