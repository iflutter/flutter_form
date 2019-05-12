library flutter_form;

import 'package:flutter_form/flutter_form.dart';
import 'package:flutter_form/src/field_parse.dart';

export 'src/form_builder.dart';
export 'src/field/field.dart';
export 'src/field/input.dart';
export 'src/field/options.dart';
export 'src/field/selector.dart';
export 'src/validator/length.dart';
export 'src/validator/not_null.dart';
export 'src/validator/range.dart';
export 'src/validator/reg.dart';

final parser = FieldParser.instance();

Input fInput(String e) {
  var input = Input();
  parser.parseFiled(e, input);
  return input;
}

Options fOptions(String e) {
  var options = Options();
  parser.parseFiled(e, options);
  return options;
}

Selector fSelector(String e) {
  var selector = Selector();
  parser.parseFiled(e, selector);
  return selector;
}
