import 'package:movie_app/domain/models/register_model.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final RegisterModel? registerModel;

  RegisterSuccessState({this.registerModel});
}

class RegisterErrorState extends RegisterState {
  String error;
  RegisterErrorState(this.error);
}
