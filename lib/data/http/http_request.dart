// import 'package:movie_app/presentation/presentation_managers/exports.dart';
//
// //create future http request function here
// class HttpRequest{
// //get genres
//   static Future<GenreModel> getGenres(String shows) async {
//     var params =
//     {
//       "api_key": AppConst.apiKey,
//       "language": "en-us",
//       "page": 1
//     };
//     //String shows here is to indicate
//     // this gen res are return base on "movie" or "tv"
//     try {
//       //if there is data retrieved, return data
//       Response response =
//       await AppConst.dio.get("${AppConst.getGenreUrl}/$shows/list", queryParameters: params);
//       return GenreModel.fromJson(response.data);
//     } catch (error){
//     //else return erro
//     return GenreModel.withError("$error");
//     }
//   }
// //get reviews
//   static Future<ReviewsModel> getReviews(String shows, int id) async {
//     var params =
//     {
//       "api_key": AppConst.apiKey,
//       "language": "en-us",
//       "page": 1
//     };
//     try {
//       Response response = await AppConst.dio.get("${AppConst.mainUrl}/$shows/$id/reviews",
//           queryParameters: params);
//       return ReviewsModel.fromJson(response.data);
//     } catch (error) {
//       return ReviewsModel.withError("$error");
//     }
//   }
// //get Trailers
//   static Future<TrailersModel> getTrailers(String shows, int id) async {
//     var params = {
//       "api_key": AppConst.apiKey,
//       "language": "en-us"
//     };
//     try {
//       Response response = await AppConst.dio.get("${AppConst.mainUrl}/$shows/$id/videos",
//           queryParameters: params);
//       return TrailersModel.fromJson(response.data);
//     } catch (error) {
//       return TrailersModel.withError("$error");
//     }
//   }
// //get Similar Movies
//   static Future<MovieModel> getSimilarMovies(int id) async {
//     var params = {
//       "api_key": AppConst.apiKey,
//       "language": "en-us",
//       "page": 1
//     };
//
//     try {
//       Response response =
//       await AppConst.dio.get("${AppConst.getMoviesUrl}/$id/similar", queryParameters: params);
//       return MovieModel.fromJson(response.data);
//     } catch (error) {
//       return MovieModel.withError("$error");
//     }
//   }
// //get Similar TV Shows
//   static Future<TVModel> getSimilarTVShows(int id) async {
//     var params = {
//       "api_key": AppConst.apiKey,
//       "language": "en-us",
//       "page": 1
//     };
//     try {
//       Response response =
//       await AppConst.dio.get("${AppConst.getTVUrl}/$id/similar", queryParameters: params);
//       return TVModel.fromJson(response.data);
//     } catch (error) {
//       return TVModel.withError("$error");
//     }
//   }
// //get Discover Movies
//   static Future<MovieModel> getDiscoverMovies(int id) async {
//     var params = {
//       "api_key": AppConst.apiKey,
//       "language": "en-us",
//       "page": 1,
//       "with_genres": id,//discover movies by genres
//     };
//
//     try {
//       Response response =
//       await AppConst.dio.get("${AppConst.getDiscoverUrl}/movie", queryParameters: params);
//       return MovieModel.fromJson(response.data);
//     } catch (error) {
//       return MovieModel.withError("$error");
//     }
//   }
// //get Discover TV Shows
//   static Future<TVModel> getDiscoverTVShows(int id) async {
//     var params = {
//       "api_key": AppConst.apiKey,
//       "language": "en-us",
//       "page": 1,
//       "with_genres": id,
//     };
//
//     try {
//       Response response =
//       await AppConst.dio.get("${AppConst.getDiscoverUrl}/tv", queryParameters: params);
//       return TVModel.fromJson(response.data);
//     } catch (error) {
//       return TVModel.withError("$error");
//     }
//   }
// //get Movies Details
//   static Future<MovieDetailsModel> getMoviesDetails(int id) async {
//     var params = {"api_key": AppConst.apiKey, "language": "en-us"};
//
//     try {
//       Response response =
//       await AppConst.dio.get("${AppConst.getMoviesUrl}/$id", queryParameters: params);
//       return MovieDetailsModel.fromJson(response.data);
//     } catch (error) {
//       return MovieDetailsModel.withError("$error");
//     }
//   }
// //get TV Shows Details
//   static Future<TVDetailsModel> getTVShowsDetails(int id) async {
//     var params = {"api_key":AppConst.apiKey, "language": "en-us"};
//
//     try {
//       Response response =
//       await AppConst.dio.get("${AppConst.getTVUrl}/$id", queryParameters: params);
//       return TVDetailsModel.fromJson(response.data);
//     } catch (error) {
//       return TVDetailsModel.withError("$error");
//     }
//   }
//
// ///get Movies with different requests
// //such as "now_playing", "popular", "top_ rated", and "upcoming"
//
// Future<MovieModel> getMovies(String request) async {
//   var params = {"api_key": AppConst.apiKey, "language": "en-us"};
//
//   try {
//     Response response =
//     await AppConst.dio.get("${AppConst.getMoviesUrl}/$request", queryParameters: params);
//     return MovieModel.fromJson(response.data);
//   } catch (error) {
//     return MovieModel.withError("$error");
//   }
// }  static import 'package:movie_app/presentation/presentation_managers/constancts_manager.dart';

//
// //get tv shows with different requests
// // such as "airing_today", "on_ the_air", "top_ rated", and "popular
//   static Future<TVModel> getTVShows(String request) async {
//     var params = {"api_key": AppConst.apiKey, "language": "en-us"};
//     try {
//       Response response =
//       await AppConst.dio.get("${AppConst.getTVUrl}/$request", queryParameters: params);
//       return TVModel.fromJson(response.data);
//     } catch (error) {
//       return TVModel.withError("$error");
//     }
//   }
//
//
// //now, 1 have done all these api integration and json model
// //let's try to call api
//
// }