import 'package:flutter/material.dart';
import 'package:flutter_form/flutter_form.dart';
import 'package:flutter_form/src/widget/options_widget.dart';

class Options extends Field {
  Options({
    String key,
    String label,
    String hint,
    String prefixId,
    String suffixId,
    String prefixText,
    AppendedTextStyle prefixTextStyle,
    String suffixText,
    AppendedTextStyle suffixTextStyle,
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
  getValue() {
    return _key?.currentState.getValue();
  }

  OptionsWidget _widget;
  GlobalKey<OptionsFieldState> _key;

  @override
  FieldWidget build(FormBuilderState formState, BuildContext context) {
    _key = GlobalKey<OptionsFieldState>();
    _widget = OptionsWidget(this, formState, key: _key);
    return _widget;
  }
}
