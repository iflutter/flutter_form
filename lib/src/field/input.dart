import 'package:flutter/material.dart';
import 'package:flutter_form/flutter_form.dart';
import 'package:flutter_form/src/widget/field_widget.dart';
import 'package:flutter_form/src/widget/input_widget.dart';

class Input extends Field {
  Input(
      {String key,
      String label,
      String hint,
      List<Validator> validators,
      String validatorsExp})
      : super(key: key, label: label, hint: hint, validators: validators);

  @override
  getValue() {
    return _inputWidget?.getValue();
  }

  InputWidget _inputWidget;

  @override
  FieldWidget build(BuildContext context) {
    _inputWidget = InputWidget(this);
    return _inputWidget;
  }
}
