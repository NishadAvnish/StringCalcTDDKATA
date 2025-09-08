import 'lib/string_calculator.dart';

void main() {
  final calculator = StringCalculator();

  String input = "//[***]\n1***2***3";

  try {
    int result = calculator.addNumber(input);
    print("Result: $result");
  } on FormatException catch (e) {
    print("${e.message}");
  } catch (e) {
    print("Error: $e");
  }
}
