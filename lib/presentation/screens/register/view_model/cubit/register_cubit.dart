import 'package:movie_app/domain/models/register_model.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  RegisterModel? registerModel;

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  })
  {
    emit(RegisterLoadingState());
    DioHelper.postData(
        url:AppConst.register,
        data: {
          'name' : name,
          'email' : email,
          'password' : password,
          'phone' : phone,
        }).then((value){
      registerModel = RegisterModel.fromJson(value!.data);
      emit(RegisterSuccessState(registerModel: registerModel));
    }).catchError((error)
    {
      emit(RegisterErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }
}
