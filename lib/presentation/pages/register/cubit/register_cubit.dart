import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_dicoding/domain/usecases/register_usecase.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final RegisterUsecase registerUsecase = RegisterUsecase();

  void onRegisterPressedEvent(
      String name, String email, String password) async {
    emit(RegisterLoadingState());
    final result = await registerUsecase.onRegister(name, email, password);
    result.fold(
        (failure) => emit(RegisterErrorState(
            message: failure.message ?? 'An Error Has Occured!')),
        (register) => emit(RegisterLoadedState()));
  }
}
