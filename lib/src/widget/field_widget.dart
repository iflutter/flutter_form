import 'package:flutter/cupertino.dart';
import 'package:flutter_form/flutter_form.dart';

abstract class FieldWidget<T extends Field> extends StatefulWidget {
  final T filed;

  FieldWidget(this.filed);

  dynamic getValue();
}
