import 'package:flutter/services.dart';

class NegativeNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    if (newValue.text == '-') {
      return newValue;
    }

    if (newValue.text.startsWith('-')) {
      return newValue;
    } else {
      return TextEditingValue(
        text: "-${newValue.text}",
        selection: TextSelection.collapsed(offset: newValue.selection.end + 1),
      );
    }
  }
}
