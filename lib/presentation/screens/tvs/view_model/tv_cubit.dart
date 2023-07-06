import 'package:movie_app/domain/models/tv/tv_details_model.dart';
import 'package:movie_app/domain/models/tv/tv_model.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:movie_app/presentation/screens/tvs/view_model/tv_state.dart';

class TvCubit extends Cubit<TvState>{
  TvCubit() : super(TvInitial());
  static TvCubit get(context) => BlocProvider.of(context);

   Future<TVModel> getTVShows(String request) async {
    var params = {"api_key": AppConst.apiKey, "language": "en-us"};
    try {
      Response response =
      await Dio().get("${AppConst.getTVUrl}/$request", queryParameters: params);
      return TVModel.fromJson(response.data);
    } catch (error) {
      return TVModel.withError("$error");
    }
  }

   Future<TVDetailsModel> getTVShowsDetails(int id) async {
    var params = {"api_key":AppConst.apiKey, "language": "en-us"};

    try {
      Response response =
      await Dio().get("${AppConst.getTVUrl}/$id", queryParameters: params);
      return TVDetailsModel.fromJson(response.data);
    } catch (error) {
      return TVDetailsModel.withError("$error");
    }
  }

   Future<TVModel> getDiscoverTVShows(int id) async {
    var params = {
      "api_key": AppConst.apiKey,
      "language": "en-us",
      "page": 1,
      "with_genres": id,
    };

    try {
      Response response =
      await Dio().get("${AppConst.getDiscoverUrl}/tv", queryParameters: params);
      return TVModel.fromJson(response.data);
    } catch (error) {
      return TVModel.withError("$error");
    }
  }

   Future<TVModel> getSimilarTVShows(int id) async {
    var params = {
      "api_key": AppConst.apiKey,
      "language": "en-us",
      "page": 1
    };
    try {
      Response response =
      await Dio().get("${AppConst.getTVUrl}/$id/similar", queryParameters: params);
      return TVModel.fromJson(response.data);
    } catch (error) {
      return TVModel.withError("$error");
    }
  }

}