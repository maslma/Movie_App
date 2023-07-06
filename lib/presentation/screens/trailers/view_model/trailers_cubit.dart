import 'package:movie_app/domain/models/trailers_model.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:movie_app/presentation/screens/trailers/view_model/trailers_state.dart';

class TrailersCubit extends Cubit<TrailersInitial>{
  TrailersCubit() : super(TrailersInitial());
  static TrailersCubit get(context) => BlocProvider.of(context);

   Future<TrailersModel> getTrailers(String shows, int id) async {
    var params = {
      "api_key": AppConst.apiKey,
      "language": "en-us"
    };
    try {
      Response response = await Dio().get("${AppConst.mainUrl}/$shows/$id/videos",
          queryParameters: params);
      return TrailersModel.fromJson(response.data);
    } catch (error) {
      return TrailersModel.withError("$error");
    }
  }


}