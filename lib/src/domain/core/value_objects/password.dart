part of 'value_objects.dart';

class Password extends ValueObject<String> {

  factory Password(String value) {
    return Password._(value, validatePassword(value));
  }

  Password._(this.value, this.error);

  final String value;
  final String? error;

  bool isValid() => error != null;

}


String? validatePassword(String input) {
  if(input.length < 6) {
    return 'Password must be at least 6 characters!';
  }
}