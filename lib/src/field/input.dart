import 'package:flutter_form/flutter_form.dart';

class Input extends Field {
  Input({String key, String label, String hint, List<Validator> validators,String validatorsExp})
      : super(key: key, label: label, hint: hint, validators: validators);
  Input.parse(String expression){
    //
  }
  @override
  getValue() {
    // TODO: implement getValue
    return null;
  }
}
