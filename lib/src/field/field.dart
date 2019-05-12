import 'package:flutter/cupertino.dart';
import 'package:flutter_form/flutter_form.dart';

abstract class Field {
  List<Validator> validators;
  String key;
  String label;
  String hint;
  String prefixId;
  String suffixId;
  String prefixText;
  TextStyle prefixTextStyle;
  String suffixText;
  TextStyle suffixTextStyle;

  Field(
      {String key,
      String label,
      String hint,
      String prefixId,
      String suffixId,
      String prefixText,
      TextStyle prefixTextStyle,
      String suffixText,
      TextStyle suffixTextStyle,
      List<Validator> validators}) {
    this.key = key;
    this.label = label;
    this.hint = hint;
    this.prefixId = prefixId;
    this.suffixId = suffixId;
    this.prefixText= prefixText;
    this.prefixTextStyle = this.prefixTextStyle;
    this.suffixText= suffixText;
    this.suffixTextStyle = suffixTextStyle;
    this.validators = validators;
  }

  dynamic getValue();

  FieldWidget build(FormBuilderState formState, BuildContext context);
}

abstract class Validator<T> {
  dynamic validate(T value);
}
