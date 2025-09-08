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

  test("throw exception on negative numbers", () {
    expect(
      () => calculator.addNumber("1,-1,3,4,-2"),
      throwsA(
        predicate(
          (e) =>
              e is FormatException &&
              e.message == "negative numbers not allowed -1,-2",
        ),
      ),
    );
  });

  test("custom delimiters with empty numbers", () {
    expect(calculator.addNumber("//;\n"), 0);
  });

  test("input satifying all above condition except -ve number", () {
    expect(calculator.addNumber("//;\n1;2\n5"), 8);
  });

  test("invalid input starting with //", () {
    expect(
      () => calculator.addNumber("//;1;2;5"),
      throwsA(
        predicate((e) => e is FormatException && e.message == "Invalid input"),
      ),
    );
  });

  test("Numbers bigger than 1000 should be ignored", () {
    expect(calculator.addNumber("2,1001"), 2);
  });
}
