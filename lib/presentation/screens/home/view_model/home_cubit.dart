import 'package:movie_app/domain/models/genres_model.dart';
import 'package:movie_app/domain/models/movie/movie_details_model.dart';
import 'package:movie_app/domain/models/reviews_model.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

Future<MovieModel> getMovies(String request) async {
  var params = {"api_key": AppConst.apiKey, "language": "en-us"};

  try {
    Response response =
    await Dio().get("${AppConst.getMoviesUrl}/$request", queryParameters: params);
    return MovieModel.fromJson(response.data);
  } catch (error) {
    return MovieModel.withError("$error");
  }
}

Future<MovieModel> getTypeMovies(String request) async {
  var params = {"api_key": AppConst.apiKey, "language": "en-us"};
  try {
    Response response =
    await Dio().get("${AppConst.getMoviesUrl}/$request", queryParameters: params);
    return MovieModel.fromJson(response.data);
  } catch (error) {
    return MovieModel.withError("$error");
  }
}

Future<MovieModel> getSimilarMovies(int id) async {
    var params = {
      "api_key": AppConst.apiKey,
      "language": "en-us",
      "page": 1
    };

    try {
      Response response =
      await Dio().get("${AppConst.getMoviesUrl}/$id/similar", queryParameters: params);
      return MovieModel.fromJson(response.data);
    } catch (error) {
      return MovieModel.withError("$error");
    }
  }

Future<MovieModel> getDiscoverMovies(int id) async {
    var params = {
      "api_key": AppConst.apiKey,
      "language": "en-us",
      "page": 1,
      "with_genres": id,//discover movies by genres
    };

    try {
      Response response =
      await Dio().get("${AppConst.getDiscoverUrl}/movie", queryParameters: params);
      return MovieModel.fromJson(response.data);
    } catch (error) {
      return MovieModel.withError("$error");
    }
  }

Future<GenreModel> getGenres(String shows) async {
    var params =
    {
      "api_key": AppConst.apiKey,
      "language": "en-us",
      "page": 1
    };
    try {
      Response response =
      await Dio().get("${AppConst.getGenreUrl}/$shows/list", queryParameters: params);
      return GenreModel.fromJson(response.data);
    } catch (error){
    return GenreModel.withError("$error");
    }
  }

Future<MovieDetailsModel> getMoviesDetails(int id) async {
    var params = {"api_key": AppConst.apiKey, "language": "en-us"};
    try {
      Response response =
      await Dio().get("${AppConst.getMoviesUrl}/$id", queryParameters: params);
      return MovieDetailsModel.fromJson(response.data);
    } catch (error) {
      return MovieDetailsModel.withError("$error");
    }
  }

Future<ReviewsModel> getReviews(String shows, int id) async {
    var params =
    {
      "api_key": AppConst.apiKey,
      "language": "en-us",
      "page": 1
    };
    try {
      Response response = await Dio().get("${AppConst.mainUrl}/$shows/$id/reviews",
          queryParameters: params);
      return ReviewsModel.fromJson(response.data);
    } catch (error) {
      return ReviewsModel.withError("$error");
    }
  }
}