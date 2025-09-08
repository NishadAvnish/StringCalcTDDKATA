class StringCalculator {
  int addNumber(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    List<String> numList = numbers.split(",");
    List<int> parsedList = numList.map((ele) => int.parse(ele)).toList();
    int sum = parsedList.reduce(
      (accumulator, currentEle) => accumulator + currentEle,
    );
    return sum;
  }
}
