import 'package:movie_app/presentation/presentation_managers/exports.dart';

class HomeCubit extends Cubit<HomeState>{

  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  ///get Movies with different requests
//such as "now_playing", "popular", "top_ rated", and "upcoming"
  MovieModel? movieModel;
  void getMovies() {
    emit(HomeGetMoviesLoadingState());
    Dio().get(
      'https://api.themoviedb.org/3/movie/now_playing?api_key=0eeb15efa75896ed8f97a4cb1b9c3fd5&language=en-US&page=1'
    ).then((value) {
      movieModel = MovieModel.fromJson(value.data);
      emit(HomeGetMoviesSuccessState());
    }).catchError((error) {
      emit(HomeGetMoviesErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }
}