import 'package:flutter/foundation.dart';
import 'package:flutter_assignment/features/auth/domain/enitity/user.dart';
import 'package:flutter_assignment/features/auth/domain/usecase/user_sign_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/user_login.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _signUp;
  final UserLogin _login;
  AuthBloc({required UserSignUp signUp, required UserLogin login})
      : _signUp = signUp,
        _login = login,
        super(AuthInitial()) {
    on<AuthSignup>((event, emit) async {
      emit(AuthLoading());
      final response = await _signUp(UserSignUpParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ));
      response.fold(
        (faliure) => emit(AuthFailed(faliure.message)),
        (user) => emit(
          AuthSuccess(user: user),
        ),
      );
    });
    on<AuthLogin>((event, emit) async {
      emit(AuthLoading());
      final response = await _login(
        UserLoginParams(email: event.email, password: event.password),
      );
      response.fold(
        (faliure) => emit(AuthFailed(faliure.message)),
        (user) => emit(
          AuthSuccess(user: user),
        ),
      );
    });
  }
}
