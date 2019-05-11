import 'package:flutter/cupertino.dart';
import 'package:flutter_form/src/widget/field_widget.dart';

abstract class Field {
  List<Validator> validators;
  String key;
  String label;
  String hint;

  Field({String key, String label, String hint, List<Validator> validators}) {
    this.key = key;
    this.label = label;
    this.hint = hint;
    this.validators = validators;
  }

  dynamic getValue();

  FieldWidget build(BuildContext context);
}

abstract class Validator<T> {
  dynamic validate(T value);
}
