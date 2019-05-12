import 'package:flutter/material.dart';
import 'package:flutter_form/flutter_form.dart';
import 'package:flutter_form/src/widget/input_widget.dart';

class Input extends Field {
  Input(
      {String key,
      String label,
      String hint,
      String prefixId,
      String suffixId,
      String prefixText,
      TextStyle prefixTextStyle,
      String suffixText,
      TextStyle suffixTextStyle,
      List<Validator> validators,
      String validatorsExp})
      : super(
            key: key,
            label: label,
            hint: hint,
            suffixId: suffixId,
            suffixText: suffixText,
            suffixTextStyle: suffixTextStyle,
            validators: validators);

  @override
  getValue() {
    return _key?.currentState.getValue();
  }

  InputWidget _widget;
  GlobalKey<InputFieldState> _key;

  @override
  FieldWidget build(FormBuilderState formState, BuildContext context) {
    _key = GlobalKey<InputFieldState>();
    _widget = InputWidget(this, formState, key: _key);
    return _widget;
  }
}
