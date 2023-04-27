import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final bool error;
  final String message;
  const RegisterEntity({required this.error, required this.message});

  @override
  List<Object?> get props => [error, message];
}
