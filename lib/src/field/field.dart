abstract class Field {
  List<Validator> validators;
  String key;
  String label;
  String hint;

  Field({String key, String label, String hint, List<Validator> validators}) {
    this.key = key;
    this.label = label;
    this.hint = hint;
    this.validators = validators;
  }

  dynamic getValue();
}

abstract class Validator<T> {
  dynamic validate(T value);
}
