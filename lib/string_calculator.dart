class StringCalculator {
  int addNumber(String numbers) {
    String delimiter = r'[, \n]';
    if (numbers.startsWith("//")) {
      int newLineIndex = numbers.indexOf("\n");
      if (newLineIndex == -1) throw FormatException("Invalid input");
      delimiter = numbers.substring(2, newLineIndex);
      delimiter = '[$delimiter \n]';
      numbers = numbers.substring(newLineIndex + 1);
    }

    if (numbers.isEmpty) {
      return 0;
    }

    List<String> numList = numbers.split(RegExp(delimiter));
    String negativeNumbers = "";

    List<int> parsedList = numList.map((ele) {
      int num = int.parse(ele);
      if (num < 0) {
        negativeNumbers += negativeNumbers.isEmpty ? "$num" : ",$num";
      }
      return num;
    }).toList();

    if (negativeNumbers.isNotEmpty) {
      throw FormatException("negative numbers not allowed $negativeNumbers");
    }

    int sum = parsedList.reduce(
      (accumulator, currentEle) => accumulator + currentEle,
    );
    return sum;
  }
}
