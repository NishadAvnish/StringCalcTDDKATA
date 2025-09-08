import 'package:flutter_test/flutter_test.dart';
import 'package:tddcalc/string_calculator.dart';

void main() {
  late StringCalculator calculator;

  setUp(() {
    calculator = StringCalculator();
  });

  test("return 0 incase of empty string input", () {
    expect(calculator.addNumber(""), equals(0));
  });

  test("return number itself for input with single number", () {
    expect(calculator.addNumber("1"), equals(1));
  });

  test("return sum of comma seperated numbers", () {
    expect(calculator.addNumber("1,2,3"), equals(6));
  });
  test("return sum with newlines as delimiters", () {
    expect(calculator.addNumber("1\n2,3"), equals(6));
  });

  test("return sum of input with custom delimiters", () {
    expect(calculator.addNumber("//;\n1;2"), equals(3));
  });
}
