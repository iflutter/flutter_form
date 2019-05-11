import 'package:flutter/material.dart';
import 'package:flutter_form/flutter_form.dart';
import 'package:flutter_form/src/widget/field_widget.dart';
import 'package:flutter_form/src/widget/selector_widget.dart';

class Selector extends Field {
  Selector({String key, String label, String hint, List<Validator> validators})
      : super(key: key, label: label, hint: hint, validators: validators);

  @override
  getValue() {
    return _inputWidget?.getValue();
  }

  SelectorWidget _inputWidget;

  @override
  FieldWidget build(BuildContext context) {
    _inputWidget = SelectorWidget(this);
    return _inputWidget;
  }
}
