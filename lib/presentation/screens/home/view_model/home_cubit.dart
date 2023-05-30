import 'package:movie_app/domain/models/genres_model.dart';
import 'package:movie_app/domain/models/movie/movie_details_model.dart';
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

 void getTypeMovies(String request) {
    emit(HomeGetTypeMoviesLoadingState());
    Dio().get(
      'https://api.themoviedb.org/3/movie/$request',
      queryParameters: {
        "language": "en-us",
        "api_key" : "0eeb15efa75896ed8f97a4cb1b9c3fd5"
      }
    ).then((value) {
      movieModel = MovieModel.fromJson(value.data);
      emit(HomeGetTypeMoviesSuccessState());
    }).catchError((error) {
      emit(HomeGetTypeMoviesErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }

  void getDiscoverMovies(int id) {
    emit(HomeGetDiscoverLoadingState());
    Dio().get(
      'https://api.themoviedb.org/3/discover/movie?api_key=0eeb15efa75896ed8f97a4cb1b9c3fd5&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate',
      queryParameters: {
        "language": "en-us",
        "page": 1,
        "with_genres": id,//discover movies by genres
      }
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
  MovieDetails? movieDetails;

  void getMoviesDetails(int id) {
      emit(HomeGetDetailsMoviesLoadingState());
    Dio().get(
        'https://api.themoviedb.org/3/movie/$id',
        queryParameters: {
          "language": "en-us",
          "api_key" : "0eeb15efa75896ed8f97a4cb1b9c3fd5"
        }
    ).then((value) {
      movieDetails = MovieDetails.fromJson(value.data);
      emit(HomeGetDetailsMoviesSuccessState());
    }).catchError((error) {
      emit(HomeGetDetailsMoviesErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }


}