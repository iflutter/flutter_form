import 'package:flutter/material.dart';
import 'package:flutter_form/flutter_form.dart';

// ignore: must_be_immutable
class FieldBasicRow extends StatelessWidget {
  Widget child;
  FieldWidget fieldWidget;

  FieldBasicRow({this.child, this.fieldWidget});

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
      rowChildren.add(suffix);
    }
    return Row(
      children: rowChildren,
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }
}

// ignore: must_be_immutable
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
              border: Border(
                  bottom: BorderSide(
                      color: isFocused ? Colors.red : Colors.grey, width: 1))),
          child: child)
    ];
    if (errorText != null && errorText.isNotEmpty) {
      children.add(Text(
        errorText,
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Colors.orange,
          fontSize: 15,
        ),
      ));
    }
    return Column(
      children: children,
      crossAxisAlignment: CrossAxisAlignment.end,
    );
  }
}

// ignore: must_be_immutable
class FieldRow extends StatelessWidget {
  Widget prefix;
  Widget suffix;
  Widget content;

  FieldRow({this.prefix, this.suffix, this.content});

  @override
  Widget build(BuildContext context) {}
}
