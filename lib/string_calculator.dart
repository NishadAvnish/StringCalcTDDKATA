class StringCalculator {
  int addNumber(String numbers) {
    String delimiter = r'[, \n]';
    if (numbers.startsWith("//")) {
      int newLineIndex = numbers.indexOf("\n");
      if (newLineIndex == -1) throw FormatException("Invalid input");
      
      String delimiterPart = numbers.substring(2, newLineIndex);

      // Check if delimiter is wrapped in [ ] for multi char delimiter
      if (delimiterPart.startsWith("[") && delimiterPart.endsWith("]")) {
        String multiDelimiter = delimiterPart.substring(
          1,
          delimiterPart.length - 1,
        );
        delimiter ='${RegExp.escape(multiDelimiter)}|\n';
        
      } else {
        delimiter = '${RegExp.escape(delimiterPart)}|\n';
      }

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

    int sum = parsedList.fold(0,(accumulator, currentEle) {
      if (currentEle > 1000) return accumulator;
      return accumulator + currentEle;
    });
    return sum;
  }
}
