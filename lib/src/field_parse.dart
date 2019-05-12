import 'package:flutter/cupertino.dart';
import 'package:flutter_form/flutter_form.dart';

class FieldParser {
  static final _decodeFlag = '+^';
  static final _tagAssign = '='.codeUnitAt(0);
  static final _tagAssignRange = '"'.codeUnitAt(0);
  static final _tagAttrGroup = ','.codeUnitAt(0);

  static final FieldParser parser = FieldParser._();

  factory FieldParser.instance() {
    return parser;
  }

  FieldParser._() {
    //
  }

  void parseFiled(String exp, Field field) {
    String lastKey;
    String lastValue;
    bool isFindKey = true;
    bool isKeyStart = true;
    int keyStartIndex = 0;
    //
    bool isFindValue = false;
    bool isValueStart = false;
    int valueStartIndex = 0;
    //
    print("ttt on parse filed $exp");
    for (int i = 0; i < exp.length; i++) {
      final charCode = exp.codeUnitAt(i);
      if (isFindKey) {
        if (isKeyStart) {
          if (charCode == _tagAssign) {
            lastKey = exp.substring(keyStartIndex, i).trim();
            isFindKey = false;
            isFindValue = true;
            continue;
          } else if (charCode == _tagAttrGroup) {
            //empty value
            isFindKey = true;
            isFindValue = false;
            lastKey = exp.substring(keyStartIndex, i).trim();
            keyStartIndex = i + 1;
            _onFindAttr(field, lastKey);
            continue;
          }
        } else {
          if (charCode == _tagAttrGroup) {
            keyStartIndex = i + 1;
            isFindKey = true;
            isKeyStart = true;
            continue;
          }
        }
      }
      if (isFindValue) {
        if (isValueStart) {
          if (charCode == _tagAssignRange) {
            isValueStart = false;
            isFindValue = false;
            isFindKey = true;
            isKeyStart = false;
            lastValue = exp.substring(valueStartIndex, i);
            if (lastValue.startsWith(_decodeFlag)) {
              lastValue = lastValue
                  .substring(_decodeFlag.length)
                  .replaceAll("&quot;", '\"');
            }
            _onFindAttr(field, lastKey, lastValue);
            continue;
          }
        } else {
          if (charCode == _tagAssignRange) {
            valueStartIndex = i + 1;
            isValueStart = true;
            continue;
          }
        }
      }
    }
  }

  void _onFindAttr(Field field, String key, [String value]) {
    print('ttt $key = ${value ?? "empty"}');
    Validator validator;
    switch (key) {
      case 'k':
      case 'key':
        field.key = value;
        print("ttt filed.key ${field.key}");
        break;
      case 'l':
      case 'label':
        field.label = value;
        break;
      case 'h':
      case 'hint':
        field.hint = value;
        break;
      case 'v-req':
        validator = NotNull();
        break;
      case 'v-len':
        validator = Length();
        break;
      case 'v-reg':
        validator = Reg();
        break;
      case 'prefix':
        if (value != null) {
          _parsePrefix(field, value);
        }
        break;
      case 'suffix':
        if (value != null) {
          _parseSuffix(field, value);
        }
        break;
    }
    if (validator != null) {
      if (field.validators == null) {
        field.validators = [];
      }
      field.validators.add(validator);
    }
  }

  int _ParseColor(String hexColor) {
    hexColor = hexColor.toUpperCase();
    hexColor = hexColor.replaceAll('#', '');
    hexColor = hexColor.replaceAll('0X', '');
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  AppendedTextStyle _parseAppendedTextStyle(String argParts) {
    AppendedTextStyle style = AppendedTextStyle();
    var argsList = argParts.split(" ");
    for (String argKV in argsList) {
      int keyEnd = argKV.indexOf('\|');
      if (keyEnd > 0) {
        String key = argKV.substring(0, keyEnd);
        String value = argKV.substring(keyEnd + 1, argKV.length);
        switch (key) {
          case 'color':
            try {
              style.color = _ParseColor(value);
            } catch (e) {
              print(e);
            }
            break;
          case 'size':
            try {
              style.fontSize = double.parse(value);
            } catch (e) {
              print(e);
            }
            break;
        }
      }
    }
    return style;
  }

  static final _tagStrValue = 'str:';
  static final _tagIdValue = 'str:';
  static final _tagValueTagSplitorCode = ':'.codeUnitAt(0);

  void _parsePrefix(Field field, String contentStr) {
    contentStr = contentStr.trimLeft();
    if (contentStr.startsWith(_tagStrValue)) {
      int endArgs = 4;
      for (int i = 4; i < contentStr.length; i++) {
        if (contentStr.codeUnitAt(i) == _tagValueTagSplitorCode) {
          endArgs = i;
          break;
        }
      }
      String argParts = contentStr.substring(4, endArgs);
      field.prefixText = contentStr.substring(endArgs + 1, contentStr.length);
      field.prefixTextStyle = _parseAppendedTextStyle(argParts);
      //
      print(
          "ttt prefix ${field.prefixText} ${field.prefixTextStyle
              .fontSize} ${field.prefixTextStyle.color}");
    } else {
      field.prefixId = contentStr;
    }
  }

  void _parseSuffix(Field field, String contentStr) {
    contentStr = contentStr.trimLeft();
    if (contentStr.startsWith(_tagStrValue)) {
      int endArgs = 4;
      for (int i = 4; i < contentStr.length; i++) {
        if (contentStr.codeUnitAt(i) == _tagValueTagSplitorCode) {
          endArgs = i;
          break;
        }
      }
      String argParts = contentStr.substring(4, endArgs);
      field.suffixText = contentStr.substring(endArgs + 1, contentStr.length);
      field.suffixTextStyle = _parseAppendedTextStyle(argParts);
      //
      print(
          "ttt suffix ${field.suffixText} ${field.suffixTextStyle
              .fontSize} ${field.suffixTextStyle.color}");
    } else {
      field.suffixId = contentStr;
    }
  }
}
