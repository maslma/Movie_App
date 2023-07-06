import 'package:movie_app/domain/models/genres_model.dart';
import 'package:movie_app/presentation/global_widgets/error_widget.dart';
import 'package:movie_app/presentation/global_widgets/loading_widget.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:movie_app/presentation/screens/home/view_model/home_cubit.dart';
import 'genres_list_widget.dart';

class GetGenresWidget extends StatelessWidget {
  const GetGenresWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return FutureBuilder<GenreModel>(
              future: cubit.getGenres("tv"),
              builder: (context, AsyncSnapshot<GenreModel> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.error != null &&
                      snapshot.data!.error!.isNotEmpty) {
                    return GlobalErrorWidget(error: snapshot.data!.error);
                  }
                  return GenreLists(
                    genres: snapshot.data!.genres,
                  );
                } else if (snapshot.hasError) {
                  return GlobalErrorWidget(error: snapshot.error);
                } else {
                  return const GlobalLoadingWidget();
                }
              });
        });
  }
}
