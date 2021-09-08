import 'package:equatable/equatable.dart';

enum AuthSignInStates { unknown, success, fail }


class AuthSignInFailureOrSuccess extends Equatable {

  const AuthSignInFailureOrSuccess(this.state);

  final AuthSignInStates state;

  @override
  List<Object?> get props => [];
}