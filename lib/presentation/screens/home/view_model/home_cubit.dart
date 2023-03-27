import 'package:movie_app/domain/models/genres_model.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';

class HomeCubit extends Cubit<HomeState>{

  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);


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
 void getUpcoming() {
    emit(HomeGetUpcomingLoadingState());
    Dio().get(
      'https://api.themoviedb.org/3/movie/upcoming?api_key=0eeb15efa75896ed8f97a4cb1b9c3fd5&language=en-US&page=1'
    ).then((value) {
      movieModel = MovieModel.fromJson(value.data);
      emit(HomeGetUpcomingSuccessState());
    }).catchError((error) {
      emit(HomeGetUpcomingErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }

  void getDiscoverMovies(int id) {
    emit(HomeGetDiscoverLoadingState());
    Dio().get(
      'https://api.themoviedb.org/3/discover/movie?api_key=0eeb15efa75896ed8f97a4cb1b9c3fd5&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate'
    ).then((value) {
      movieModel = MovieModel.fromJson(value.data);
      emit(HomeGetDiscoverSuccessState());
    }).catchError((error) {
      emit(HomeGetDiscoverErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }


  GenreModel? genreModel;
  void getGenre() {
    emit(HomeGetGenreLoadingState());
    Dio().get(
      'https://api.themoviedb.org/3/genre/movie/list?api_key=0eeb15efa75896ed8f97a4cb1b9c3fd5&language=en-US'
    ).then((value) {
      genreModel = GenreModel.fromJson(value.data);
      emit(HomeGetGenreSuccessState());
    }).catchError((error) {
      emit(HomeGetGenreErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }


}