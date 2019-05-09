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

  void _onFindAttr(Field filed, String key, [String value]) {
    //print('$key = ${value ?? "empty"}');
    Validator validator;
    switch (key) {
      case 'k':
        filed.key = value;
        break;
      case 'l':
        filed.label = value;
        break;
      case 'h':
        filed.hint = value;
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
    }
    if (filed.validators == null) {
      filed.validators = [];
    }
    filed.validators.add(validator);
  }
}
