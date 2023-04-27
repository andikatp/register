part of 'register_cubit.dart';

@immutable
abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterLoadedState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String message;
  RegisterErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
