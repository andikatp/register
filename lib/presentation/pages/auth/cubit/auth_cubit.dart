import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_dicoding/domain/usecases/auth_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthUsecase authUsecase;
  AuthCubit({required this.authUsecase}) : super(AuthInitial());

  void onRegisterPressedEvent(
      String name, String email, String password) async {
    emit(AuthLoadingState());
    final result = await authUsecase.onRegister(name, email, password);
    result.fold(
        (failure) => emit(AuthErrorState(
            message: failure.message ?? 'An Error Has Occured!')),
        (register) => emit(RegisterLoadedState()));
  }

  void onLoginPressedEvent(String email, String password) async {
    emit(AuthLoadingState());
    final result = await authUsecase.onLogin(email, password);
    result.fold(
        (failure) => emit(
            AuthErrorState(message: failure.message ?? 'An Error Has Occured')),
        (login) => emit(LoginLoadedState()));
  }
}
