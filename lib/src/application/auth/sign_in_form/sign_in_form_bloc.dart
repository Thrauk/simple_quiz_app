import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:simple_quizz_app/src/domain/auth/sign_in/sign_in.dart';
import 'package:simple_quizz_app/src/domain/domain.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  //SignInFormBloc() : super(SignInFormState.initial());

  SignInFormBloc({
    required Object authenticationRepository,
    required Object userRepository,

})

  @override
  Stream<SignInFormState> mapEventToState(
    SignInFormEvent event,
  ) async* {
    yield* event.map(
      emailChanged: (EmailChanged e) async* {},
      passwordChanged: (PasswordChanged e) async* {},
      signInWithEmailAndPasswordPressed: (SignInWithEmailAndPasswordPressed e) async* {},
      signInWithGooglePressed: (SignInWithGooglePressed e) async* {},
    );
  }
}
