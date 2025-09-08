import 'package:flutter_test/flutter_test.dart';
import 'package:tddcalc/string_calculator.dart';

void main() {
  StringCalculator calculator = StringCalculator();

  test("return 0 incase of empty string input", () {
    expect(calculator.addNumber(""), equals(0));
  });
}
