import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class FirebaseAuthFailure<T> with _$FirebaseAuthFailure<T> {
  const factory FirebaseAuthFailure.invalidEmail({
    required T failedValue,
  }) = InvalidEmail<T>;
  const factory FirebaseAuthFailure.weakPassword({
    required T failedValue,
  }) = WeakPassword<T>;
  const factory FirebaseAuthFailure.emailAlreadyInUse({
    required T failedValue,
  }) = EmailAlreadyInUse<T>;
  const factory FirebaseAuthFailure.serverFailure({
    required T failedValue,
  }) = ServerFailure<T>;
  const factory FirebaseAuthFailure.invalidEmailAndPasswordCombination({
    required T failedValue,
  }) = InvalidEmailAndPasswordCombination<T>;


}
