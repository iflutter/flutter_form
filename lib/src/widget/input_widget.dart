import 'package:flutter/material.dart';
import 'package:flutter_form/flutter_form.dart';
import 'package:flutter_form/src/field/input.dart';

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
    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void deactivate() {
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FieldWidgetBox(
      child: FieldBasicRow(child: TextFormField(
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
          border: InputBorder.none,
          hintText: widget.field.hint,
        ),), fieldWidget: widget,),
      isFocused: isFocused,
      errorText: _errorText,);
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

class FieldBasicRow extends StatelessWidget {
  String lable;
  Widget child;
  FieldWidget fieldWidget;

  FieldBasicRow({ this.child, this.fieldWidget});

  @override
  Widget build(BuildContext context) {
    Widget prefix = fieldWidget.createPrefixWidget(context);
    Widget suffix = fieldWidget.createSuffixWidget(context);
    var rowChildren = <Widget>[];
    if (prefix != null) {
      rowChildren.add(prefix);
    }
    rowChildren.add(Text(fieldWidget.field.label));
    if (child is Flexible) {
      rowChildren.add(child);
    } else {
      rowChildren.add(Flexible(child: child));
    }
    if (suffix != null) {
      rowChildren.add(prefix);
    }
    return Row(
      children: rowChildren, crossAxisAlignment: CrossAxisAlignment.center,);
  }
}

class FieldWidgetBox extends StatelessWidget {
  Widget child;
  String errorText;
  bool isFocused;

  FieldWidgetBox({this.child, this.errorText, this.isFocused});

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[
      Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(
                  color: isFocused ? Colors.red : Colors.grey,
                  width: 1))
          ),
          child: child
      )
    ];
    if (errorText != null && errorText.isNotEmpty) {
      children.add(
          Text(errorText,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.orange,
              fontSize: 15,
            ),));
    }
    return Column(
      children: children,
      crossAxisAlignment: CrossAxisAlignment.end,);
  }
}

class FieldRow extends StatelessWidget {
  Widget prefix;
  Widget suffix;
  Widget content;

  FieldRow({this.prefix, this.suffix, this.content});

  @override
  Widget build(BuildContext context) {

  }
}
