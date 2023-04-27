import 'package:equatable/equatable.dart';
import 'package:register_dicoding/domain/entities/register_entity.dart';

class RegisterModel extends RegisterEntity with EquatableMixin {
  RegisterModel({required bool error, required String message})
      : super(error: error, message: message);

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(error: json['error'], message: json['message']);
  }

  String getErrorMessage() {
    return message;
  }
}
