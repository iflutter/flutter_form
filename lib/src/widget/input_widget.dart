import 'package:flutter/material.dart';
import 'package:flutter_form/src/field/input.dart';
import 'package:flutter_form/src/widget/field_widget.dart';

class InputWidget extends FieldWidget<Input> {
  InputWidget(Input filed) : super(filed);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }

  @override
  getValue() {
    return null;
  }
}

class _State extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return Text('Input');
  }
}
