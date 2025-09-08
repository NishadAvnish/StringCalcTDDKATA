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
    List<int> parsedList = numList.map((ele) => int.parse(ele)).toList();
    int sum = parsedList.reduce(
      (accumulator, currentEle) => accumulator + currentEle,
    );
    return sum;
  }
}
