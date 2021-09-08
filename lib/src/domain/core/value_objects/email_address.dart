part of 'value_objects.dart';

class EmailAddress extends ValueObject<String> {

  factory EmailAddress(String value) {
    return EmailAddress._(value, validateEmailAddress(value));
  }

  EmailAddress._(this.value, this.error);

  final String value;
  final String? error;

  bool isValid() => error != null;


}


String? validateEmailAddress(String value) {
  const String emailRegex = r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

  if(!RegExp(emailRegex).hasMatch(value)) {
    return 'Email is invalid!';
  }
}