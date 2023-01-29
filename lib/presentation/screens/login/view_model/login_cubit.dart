// import 'package:movie_app/domain/models/login_model.dart';
// import 'package:movie_app/presentation/presentation_managers/exports.dart';
//
// class LoginCubit extends Cubit<LoginStates> {
//   LoginCubit() : super(LoginInitialState());
//
//   static LoginCubit get(context) => BlocProvider.of(context);
//
//   final formKey = GlobalKey<FormState>();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   LoginModel? loginUserModel;
//
//   Future<void> userLogin({
//     required String email,
//     required String password,
//
//   }) async {
//     emit(LoginLoadingState());
//     await DioHelper.postData(
//       url: AppConst.login,
//       data: {
//         'email': email,
//         'password': password,
//       },
//       token: token,
//     ).then((value) {
//       loginUserModel = LoginModel.fromJson(value!.data);
//       emit(LoginSuccessState(loginModel: loginUserModel));
//     }).catchError((error) {
//       emit(LoginErrorState(error.toString()));
//       debugPrint(error.toString());
//     });
//   }
// }
