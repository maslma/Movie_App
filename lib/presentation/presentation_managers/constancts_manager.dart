import 'package:movie_app/presentation/presentation_managers/exports.dart';

class AppConst {
  static const int splashDelay = 1500;
  // Api
//   static const baseUrl = 'https://student.valuxapps.com/api/';
//   static const banner = 'banners';
//   static const category = 'categories';
//   static const search = "products/search";
//   static const profile = 'profile';
//   static const updateProfile = 'update-profile';
//   static const cart = 'carts';
//   static const favorites = 'favorites';
//   static const register = 'register';
//   static const login = 'login';
//   static const products = 'products';
//   static const logout = 'logout';
  //still remember api key in.env file?
  // retrieve api key here
  static final String? apiKey = dotenv.env['API_KEY'];
  static const String mainUrl = "https://api.themoviedb.org/3";
  static final Dio dio = Dio();
  static var getGenreUrl = "$mainUrl/genre";
  static var getDiscoverUrl = "$mainUrl/discover";
  static var getMoviesUrl = "$mainUrl/movie";
  static var getTVUrl = "$mainUrl/tv";
}