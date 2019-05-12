import 'package:flutter/material.dart';
import 'package:flutter_form/flutter_form.dart';

// ignore: must_be_immutable
class FormBuilder extends StatefulWidget {
  String tipsRequiredFormat;
  String tipsHintFormat;
  List<Field> fields;
  Map<String, StringWidgetBuilder> stringWidgetBuilders;

  FormBuilder(
      {String tipsRequiredFormat,
      String tipsHintFormat,
      List<Field> fields,
      Map<String, StringWidgetBuilder> stringWidgetBuilders}) {
    this.tipsRequiredFormat = tipsRequiredFormat;
    this.tipsHintFormat = tipsHintFormat;
    this.fields = fields;
    this.stringWidgetBuilders = stringWidgetBuilders;
  }

  @override
  State<StatefulWidget> createState() {
    return FormBuilderState();
  }
}

class FormBuilderState extends State<FormBuilder> {
  final List<FieldWidget> fieldWidgets = List<FieldWidget>();
  Widget formWidget;

  @override
  Widget build(BuildContext context) {
    _checkBuildForm(context);
    return Form(
      child: Column(
        children: fieldWidgets,
      ),
    );
  }

  Widget createStringWidget(BuildContext context, String strId) {
    if (widget.stringWidgetBuilders == null) {
      return null;
    }
    StringWidgetBuilder builder = widget.stringWidgetBuilders[strId];
    if (builder == null) {
      return null;
    }
    return builder(context, strId);
  }

  _checkBuildForm(BuildContext context) {
    if (fieldWidgets.isNotEmpty) {
      return;
    }
    if (widget.fields == null || widget.fields.isEmpty) {
      return;
    }
    for (Field f in widget.fields) {
      var w = f.build(this, context);
      if (w != null) {
        fieldWidgets.add(w);
      }
    }
  }
}

// ignore: must_be_immutable
abstract class FieldWidget<T extends Field> extends StatefulWidget {
  T field;
  FormBuilderState formState;

  FieldWidget(this.field, this.formState, {Key key}) : super(key: key);

  Widget createPrefixWidget(BuildContext context) {
    return _createStringWidgetInner(
        context, field.prefixId, field.prefixText, field.prefixTextStyle);
  }

  Widget createSuffixWidget(BuildContext context) {
    return _createStringWidgetInner(
        context, field.suffixId, field.suffixText, field.suffixTextStyle);
  }

  Widget _createStringWidgetInner(BuildContext context, String strId,
      String text, AppendedTextStyle style) {
    if (strId != null && strId.isNotEmpty && formState != null) {
      return formState.createStringWidget(context, strId);
    }
    if (text != null && text.isNotEmpty) {
      TextStyle textStyle;
      if (style != null) {
        textStyle =
            TextStyle(fontSize: style.fontSize, color: Color(style.color));
      }
      return Text(
        text,
        style: textStyle,
      );
    }
    return null;
  }
}

abstract class FieldWidgetState<T extends FieldWidget> extends State<T> {
  dynamic getValue();

  String validate();

  void setValue(String value) {}
}

typedef StringWidgetBuilder = Widget Function(
    BuildContext context, String textId);
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
