import 'package:movie_app/data/remote/dio_helper.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';

class HomeCubit extends Cubit<HomeState>{

  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  ///get Movies with different requests
//such as "now_playing", "popular", "top_ rated", and "upcoming"
  MovieModel? movieModel;
  void getMovies() {
    emit(HomeGetMoviesLoadingState());
    DioHelper.getData(
      url: AppConst.getMoviesUrl,
    ).then((value) {
      movieModel = MovieModel.fromJson(value!.data);
      emit(HomeGetMoviesSuccessState());
    }).catchError((error) {
      emit(HomeGetMoviesErrorState(error));
    });
  }
}