import 'package:equatable/equatable.dart';

part 'email_address.dart';
part 'password.dart';


abstract class ValueObject<T> extends Equatable {
  @override
  List<Object?> get props => [];
}