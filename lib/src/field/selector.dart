import 'package:flutter/material.dart';
import 'package:flutter_form/flutter_form.dart';
import 'package:flutter_form/src/widget/selector_widget.dart';

class Selector extends Field {
  Selector({
    String key,
    String label,
    String hint,
    String prefixId,
    String suffixId,
    String prefixText,
    TextStyle prefixTextStyle,
    String suffixText,
    TextStyle suffixTextStyle,
    List<Validator> validators,
  }) : super(
            key: key,
            label: label,
            hint: hint,
            suffixId: suffixId,
            suffixText: suffixText,
            suffixTextStyle: suffixTextStyle,
            validators: validators);

  @override
  dynamic getValue() {
    return _key?.currentState.getValue();
  }

  SelectorWidget _widget;
  GlobalKey<SelectorFieldState> _key;

  @override
  FieldWidget build(FormBuilderState formState, BuildContext context) {
    _key = GlobalKey<SelectorFieldState>();
    _widget = SelectorWidget(this, formState, key: _key);
    return _widget;
  }
}
