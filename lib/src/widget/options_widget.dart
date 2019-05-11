import 'package:flutter/cupertino.dart';
import 'package:flutter_form/flutter_form.dart';
import 'package:flutter_form/src/widget/field_widget.dart';

class OptionsWidget extends FieldWidget<Options> {
  OptionsWidget(Options filed) : super(filed);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }

  @override
  getValue() {
    return null;
  }
}

class _State extends State<OptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Text('Options');
  }
}
