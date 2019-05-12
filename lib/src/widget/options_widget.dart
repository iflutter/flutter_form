import 'package:flutter/cupertino.dart';
import 'package:flutter_form/flutter_form.dart';

class OptionsWidget extends FieldWidget<Options> {
  OptionsWidget(Options field, FormBuilderState formState, {Key key})
      : super(field, formState, key: key);

  @override
  State<StatefulWidget> createState() {
    return OptionsFieldState();
  }
}

class OptionsFieldState extends FieldWidgetState<OptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Text('Options');
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
