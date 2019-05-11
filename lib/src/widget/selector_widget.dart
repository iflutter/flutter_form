import 'package:flutter/cupertino.dart';
import 'package:flutter_form/flutter_form.dart';
import 'package:flutter_form/src/widget/field_widget.dart';

class SelectorWidget extends FieldWidget<Selector> {
  SelectorWidget(Selector filed) : super(filed);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }

  @override
  getValue() {
    // TODO: implement getValue
    return null;
  }
}

class _State extends State<SelectorWidget> {
  @override
  Widget build(BuildContext context) {
    return Text('Selector');
  }
}
