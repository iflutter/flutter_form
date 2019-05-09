import 'package:flutter_form/flutter_form.dart';

var formFiledList = <Field>[
  fInput(
      'k="name",l="姓名",h="+^请输&quot;入姓名&quot;",v-req ,v-len="6",v-reg="$regUrl"')
    ..validators = [NotNull(), Length(), Range(), Reg()],
  fInput(
      'k="name",l="姓名",h="+^请输&quot;入姓名&quot;",v-req ,v-len="6",v-reg="$regUrl"'),
  fInput(
      'k="name",l="姓名",h="+^请输&quot;入姓名&quot;",v-req ,v-len="6",v-reg="$regUrl"'),
  fInput(
      'k="name",l="姓名",h="+^请输&quot;入姓名&quot;",v-req ,v-len="6",v-reg="$regUrl"'),
  fInput(
      'k="name",l="姓名",h="+^请输&quot;入姓名&quot;",v-req ,v-len="6",v-reg="$regUrl"'),
  fInput(
      'k="name",l="姓名",h="+^请输&quot;入姓名&quot;",v-req ,v-len="6",v-reg="$regUrl"'),
  Input(
      key: 'name',
      label: '姓名',
      hint: '请输入姓名',
      validatorsExp: 'req&range:6,25|reg:'),
  Options(
      key: 'name',
      label: '性别',
      hint: '请输入姓名',
      validators: [NotNull(), Length(), Range(), Reg()]),
  Selector(
      key: 'name', label: 'req|range:6,25|reg:', hint: '请输入姓名', validators: [])
];

final regUrl =
    r'/^(https?:\/\/)?([\da-z\.-]+)\\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/';

void main() {
  var str =
      'k="name",l="姓名",h="+^请输&quot;入姓名&quot;",v-req ,v-len="6",v-reg="$regUrl"';
  print(str);
}