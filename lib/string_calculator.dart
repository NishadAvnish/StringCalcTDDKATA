class StringCalculator {
  int addNumber(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    String delimiter = r'[, \n]';
    if (numbers.startsWith("//")) {
      int newLineIndex = numbers.indexOf("\n");
      delimiter = numbers.substring(2, newLineIndex);
      numbers = numbers.substring(newLineIndex + 1);
    }

    List<String> numList = numbers.split(RegExp(delimiter));
    String negativeNumbers = "";
    bool hasNegativeNumber = false;

    List<int> parsedList = numList.map((ele) {
      int num = int.parse(ele);
      if (num < 0) {
        hasNegativeNumber = num < 0;
        negativeNumbers += negativeNumbers.isEmpty ? "$num" : ",$num";
      }
      return num;
    }).toList();

    if (hasNegativeNumber) {
      throw FormatException("negative numbers not allowed $negativeNumbers");
    }

    int sum = parsedList.reduce(
      (accumulator, currentEle) => accumulator + currentEle,
    );
    return sum;
  }
}
