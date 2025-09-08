class StringCalculator {
  int addNumber(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }
    return int.parse(numbers);
  }
}
