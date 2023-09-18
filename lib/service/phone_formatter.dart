
import 'package:flutter/services.dart';

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]+'), '');
    final digitOnlyChars = digitsOnly.split('');
    var newString = <String>[];
    for (var i = 0; i < digitOnlyChars.length; i++) {
      if (i == 3 || i == 5 || i == 8 || i == 10) {
        newString.add('-');
        newString.add(digitOnlyChars[i]);
      } else {
        newString.add(digitOnlyChars[i]);
      }
    }

    final resultString = newString.join();
    return TextEditingValue(
      text: resultString,
      selection: TextSelection.collapsed(offset: resultString.length),
    );
  }
}
