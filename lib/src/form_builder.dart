import 'package:flutter/material.dart';
import 'package:flutter_form/flutter_form.dart';
import 'package:flutter_form/src/widget/field_widget.dart';

// ignore: must_be_immutable
class FormBuilder extends StatefulWidget {
  String tipsRequiredFormat;
  String tipsHintFormat;
  List<Field> fields;

  FormBuilder(
      {String tipsRequiredFormat, String tipsHintFormat, List<Field> fields}) {
    this.tipsRequiredFormat = tipsRequiredFormat;
    this.tipsHintFormat = tipsHintFormat;
    this.fields = fields;
  }

  @override
  State<StatefulWidget> createState() {
    return _FormState();
  }
}

class _FormState extends State<FormBuilder> {
  List<FieldWidget> fieldWidgets;
  Widget formWidget;

  @override
  Widget build(BuildContext context) {
    checkBuildForm();
    return Column(
      children: fieldWidgets,
    );
  }

  checkBuildForm() {
    if (fieldWidgets != null ||
        widget.fields == null ||
        widget.fields.isEmpty) {
      return;
    }

    for (Field f in widget.fields) {
    }
  }
}

//abstract class FormFiled {
//  List<Validator> validators;
//
//  FormFiled({List<Validator> validators});
//
//  Widget build(BuildContext context);
//
//  dynamic getValue();
//
//  bool validate();
//}
//
//enum InputType {
//  string,
//  number,
//}
//
//class Input extends FormFiled {
//  Input(
//      {String key,
//      String label,
//      String hint,
//      InputType type = InputType.string,
//      List<Validator> validators})
//      : super(validators: validators);
//
//  Input key(String key) {
//    return this;
//  }
//
//  Input label(String key) {
//    return this;
//  }
//
//  Input type(InputType key) {
//    return this;
//  }
//
//  Input validator(List<Validator> validators) {
//    return this;
//  }
//
//  @override
//  Widget build(BuildContext context) {}
//
//  @override
//  bool validate() {}
//
//  @override
//  dynamic getValue() {}
//}
//
/////length
/////value range
/////reg check
/////not null check
/////
//
//class NotNull extends Validator {
//  @override
//  validate(value) {
//    // TODO: implement validate
//    return null;
//  }
//}
//
//class Length extends Validator {
//  @override
//  validate(value) {
//    // TODO: implement validate
//    return null;
//  }
//}
//
//class Range extends Validator {
//  @override
//  validate(value) {
//    // TODO: implement validate
//    return null;
//  }
//}
//
//class Reg extends Validator {
//  @override
//  validate(value) {
//    // TODO: implement validate
//    return null;
//  }
//}
//
//abstract class Validator<T> {
//  dynamic validate(T value);
//}
//
//class TestFormDefine {
//  var fileds = <FormFiled>[
//    Input(
//        key: 'name',
//        label: '姓名',
//        hint: '请输入姓名',
//        type: InputType.string,
//        validators: [NotNull(), Range(), Reg(), Length()]),
//    Input(
//        key: 'name',
//        label: '姓名',
//        hint: '请输入姓名',
//        type: InputType.string,
//        validators: [NotNull(), Range(), Reg(), Length()]),
//    Input(
//        key: 'name',
//        label: '姓名',
//        hint: '请输入姓名',
//        type: InputType.string,
//        validators: [NotNull(), Range(), Reg(), Length()]),
//    Input(
//        key: 'name',
//        label: '姓名',
//        hint: '请输入姓名',
//        type: InputType.string,
//        validators: [NotNull(), Range(), Reg(), Length()]),
//    Input(
//        key: 'name',
//        label: '姓名',
//        hint: '请输入姓名',
//        type: InputType.string,
//        validators: [NotNull(), Range(), Reg(), Length()]),
//    Input(
//        key: 'name',
//        label: '姓名',
//        hint: '请输入姓名',
//        type: InputType.string,
//        validators: [NotNull(), Range(), Reg(), Length()]),
//    Input(
//        key: 'name',
//        label: '姓名',
//        hint: '请输入姓名',
//        type: InputType.string,
//        validators: [NotNull(), Range(), Reg(), Length()]),
//  ];
//}
