part of ns_components;

class NSDecimalInputFormatter extends TextInputFormatter {
  final int wholePartMaxLength;
  NSDecimalInputFormatter._(this.wholePartMaxLength);
  factory NSDecimalInputFormatter({int wholePartMaxLength = 9}) {
    return NSDecimalInputFormatter._(wholePartMaxLength > 9 ? 9 : wholePartMaxLength);
  }
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return _editText(oldValue, newValue, wholePartMaxLength: wholePartMaxLength);
  }
}

TextEditingValue _editText(
  TextEditingValue oldValue,
  TextEditingValue newValue, {
  int wholePartMaxLength = 9,
}) {
  try {
    final newValueText = newValue.text;
    final oldValueText = oldValue.text;
    final isLastCharDeleted = newValueText.isEmpty;
    if (isLastCharDeleted) return newValue.copyWith(text: "", selection: const TextSelection.collapsed(offset: 0));

    final bool isFirstCharPoint = (oldValue.text.isEmpty || oldValue.text == "0") && (newValue.text == "." || newValue.text == ".0");
    if (isFirstCharPoint) {
      return oldValue.copyWith(
        text: "0,",
        selection: TextSelection.collapsed(offset: oldValue.selection.baseOffset + 2),
      );
    }
    final isDelete = newValue.text.length - oldValue.text.length < 0;
    final isOnlyOneChar = newValue.text.length - oldValue.text.length == 1;
    final newChar = isDelete ? "" : newValue.text[newValue.selection.baseOffset - 1];
    final isNewCharPoint = isOnlyOneChar && (newChar == "." || newChar == ",");
    if (isNewCharPoint) {
      if (oldValueText.hasComma) return oldValue;
      final isLastChar = newValue.text.length == newValue.selection.baseOffset;
      if (isLastChar) {
        return oldValue.copyWith(
          text: "$oldValueText,",
          selection: TextSelection.collapsed(offset: oldValue.selection.baseOffset + 1),
        );
      } else if (oldValue.text.length == 1) {
        return newValue.copyWith(
            text: "${oldValue.text.prepoint},", selection: TextSelection.collapsed(offset: oldValue.selection.baseOffset + 2));
      } else {
        final index = newValue.selection.baseOffset - 1;
        return oldValue.copyWith(text: "${oldValueText.substring(0, index)},${oldValueText.substring(index)}");
      }
    }

    final bool isFirstCharNumber = oldValueText.isEmpty && newValueText.length == 1;
    if (isFirstCharNumber) {
      return newValue.copyWith(text: newValueText);
    }
    final bool isChangeOnPostpoint = newValueText.postpoint != oldValueText.postpoint;
    final bool isChangeOnPrepoint = newValueText.prepoint != oldValueText.prepoint;
    if (isChangeOnPostpoint) {
      final bool isExceeded = newValueText.postpoint.length > 2;
      return isExceeded ? oldValue : newValue;
    } else {
      final isPrepointEmpty = newValueText.prepoint.isEmpty;
      final cursorOffset = newValue.selection.baseOffset;
      if (isPrepointEmpty) {
        return newValue.copyWith(text: "0$newValueText");
      } else if (isChangeOnPrepoint) {
        final isDoubleZero = newValueText.prepoint == "00";
        final newValuePrepointLength = newValueText.prepoint.pure.length;
        if (isDoubleZero) {
          return newValue.copyWith(text: newValueText.removeZeroFromPrepoint(), selection: const TextSelection.collapsed(offset: 1));
        } else if (newValuePrepointLength > wholePartMaxLength && !isDelete) {
          return oldValue;
        } else if (oldValueText.prepoint == "0") {
          return newValue.copyWith(
            text: newValueText.removeZeroFromPrepoint(),
            selection: const TextSelection.collapsed(offset: 1),
          );
        } else if (newChar == "0" && cursorOffset == 1) {
          return oldValue;
        } else if (newValueText.prepoint.numberLength < 4) {
          final newText = newValueText.contains(".") ? newValueText.replaceAll(".", "") : newValueText;
          final formattedNewText = newText;
          return newValueText.contains(".")
              ? newValue.copyWith(
                  text: formattedNewText,
                  selection: TextSelection.collapsed(offset: newValue.selection.baseOffset != 0 ? newValue.selection.baseOffset - 1 : 0))
              : newValue.copyWith(text: formattedNewText);
        }
        int newLength = newValueText.prepoint.numberLength;
        if (newLength > 3) {
          final isChangeOnPoint = isDelete && ".".allMatches(oldValueText).length != ".".allMatches(newValueText).length;
          final text = isChangeOnPoint //text: dotless prepoint
              ? newValueText.prepoint.removeAt(newValue.selection.baseOffset - 1)
              : newValueText.prepoint.replaceAll(".", "");
          if (isChangeOnPoint) newLength--;
          if (newLength == 3) {
            return newValue.copyWith(
                text: "$text${newValueText.hasComma ? "," : ""}${newValueText.postpoint}",
                selection: TextSelection.collapsed(offset: newValue.selection.baseOffset - (Platform.isIOS ? 1 : 2)));
          }
          if (newLength == 6 && isDelete) {
            final newText =
                "${text.substring(0, newLength - 3)}.${text.substring(newLength - 3)}${newValueText.hasComma ? "," : ""}${newValueText.postpoint}";
            final offset = oldValue.selection.baseOffset - (Platform.isIOS ? 1 : 2);
            return newValue.copyWith(
              text: newText,
              selection: TextSelection.collapsed(
                offset: offset,
              ),
            );
          }
          if (newLength > 6) {
            final newText =
                "${text.substring(0, newLength - 6)}.${text.substring(newLength - 6, newLength - 3)}.${text.substring(newLength - 3)}${newValueText.hasComma ? "," : ""}${newValueText.postpoint}";

            final oldLength = oldValueText.prepoint.numberLength;
            final offset = oldValue.selection.baseOffset;
            return newValue.copyWith(
                text: newText,
                selection: TextSelection.collapsed(
                  offset: oldLength == 6
                      ? offset + 2
                      : isDelete
                          ? Platform.isIOS
                              ? offset
                              : offset - 1
                          : offset + 1,
                ));
          } else if (newLength > 3) {
            final newText =
                "${text.substring(0, newLength - 3)}.${text.substring(newLength - 3)}${newValueText.hasComma ? "," : ""}${newValueText.postpoint}";
            final oldLength = oldValueText.prepoint.numberLength;
            final offset = oldValue.selection.baseOffset;
            return newValue.copyWith(
              text: newText,
              selection: TextSelection.collapsed(
                offset: oldLength == 3
                    ? offset + 2
                    : isDelete
                        ? !kIsWeb && Platform.isIOS
                            ? offset
                            : offset - 1
                        : offset + 1,
              ),
            );
          }
        }
      } else if ((newValueText.hasComma && !oldValueText.hasComma) || (!newValueText.hasComma && oldValueText.hasComma)) {
        return newValue;
      }
    }
  } catch (e) {
    logger.log(e);
  }

  return oldValue;
}

extension _StringExtension on String {
  String get pure => replaceAll(".", "");
  int get numberLength => replaceAll(".", "").length;
  String makeItPure(String suffix) => replaceFromAll(this, suffix.split(''));
  String get prepoint => hasComma ? substring(0, indexOfComma) : this;
  String get postpoint => hasComma ? substring(indexOfComma + 1) : "";
  bool get hasComma => contains(",");
  int get indexOfComma => hasComma ? indexOf(",") : 0;
  String removeZeroFromPrepoint() => "${prepoint.replaceFirst("0", "")}${postpoint.isNotEmpty ? ",$postpoint" : ''}";

  String removeAt(int i) {
    return substring(0, i) + substring(i + 1);
  }
}

String replaceFromAll(String value, List<String> list) {
  for (var element in list) {
    value = value.replaceAll(element, "");
  }
  return value.replaceAll(" ", "");
}
