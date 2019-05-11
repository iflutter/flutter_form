import 'package:flutter/material.dart';
import 'package:flutter_form/flutter_form.dart';
import 'package:flutter_form/src/widget/field_widget.dart';
import 'package:flutter_form/src/widget/options_widget.dart';

class Options extends Field {
  Options({String key, String label, String hint, List<Validator> validators})
      : super(key: key, label: label, hint: hint, validators: validators);

  @override
  getValue() {
    return _inputWidget?.getValue();
  }

  OptionsWidget _inputWidget;

  @override
  FieldWidget build(BuildContext context) {
    _inputWidget = OptionsWidget(this);
    return _inputWidget;
  }
}
