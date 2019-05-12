import 'package:flutter/cupertino.dart';
import 'package:flutter_form/flutter_form.dart';

// ignore: must_be_immutable
class SelectorWidget extends FieldWidget<Selector> {
  SelectorWidget(Selector field, FormBuilderState formState, {Key key})
      : super(field, formState, key: key);

  @override
  State<StatefulWidget> createState() {
    return SelectorFieldState();
  }
}

class SelectorFieldState extends FieldWidgetState<SelectorWidget> {
  @override
  Widget build(BuildContext context) {
    return Text('Selector');
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
