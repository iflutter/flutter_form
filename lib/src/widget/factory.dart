import 'package:flutter/cupertino.dart';
import 'package:flutter_form/flutter_form.dart';
import 'package:flutter_form/src/widget/field_widget.dart';
import 'package:flutter_form/src/widget/input_widget.dart';

typedef FiledBuilder<T extends Field> = FieldWidget<T> Function(BuildContext context,T field);

var filedMap = <Type, FiledBuilder<Field>>{
  Input:(BuildContext context,Field field){
    return InputWidget(field);
  }
};
