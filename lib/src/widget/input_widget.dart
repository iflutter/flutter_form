import 'package:flutter/material.dart';
import 'package:flutter_form/flutter_form.dart';
import 'package:flutter_form/src/field/input.dart';

import 'base.dart';

// ignore: must_be_immutable
class InputWidget extends FieldWidget<Input> {
  InputWidget(Input field, FormBuilderState formState, {Key key})
      : super(field, formState, key: key);

  @override
  State<StatefulWidget> createState() {
    return InputFieldState();
  }
}

class InputFieldState extends FieldWidgetState<InputWidget> {
  String _errorText = "good hi";
  bool isFocused = false;
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void deactivate() {
    super.deactivate();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FieldWidgetBox(
      child: FieldBasicRow(
        child: TextFormField(
          focusNode: _focusNode,
          autovalidate: false,
          validator: (String value) {
            setState(() {
              _errorText = widget.field.label;
            });
            return null;
          },
          textAlign: TextAlign.right,
          decoration: InputDecoration(
              border: InputBorder.none, hintText: widget.field.hint),
        ),
        fieldWidget: widget,
      ),
      isFocused: isFocused,
      errorText: _errorText,
    );
  }

  @override
  getValue() {
    // TODO: implement getValue
    return null;
  }

  @override
  String validate() {
    // TODO: implement validate
    return null;
  }
}
