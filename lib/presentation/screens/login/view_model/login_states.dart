import 'package:movie_app/domain/models/login_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  LoginModel? loginModel;
  LoginSuccessState({this.loginModel});
}

class LoginErrorState extends LoginStates {
  String error;
  LoginErrorState(this.error);
}
