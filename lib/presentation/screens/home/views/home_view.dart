import 'package:flutter/material.dart';
import 'package:movie_app/presentation/global_widgets/shimmer_new_playing.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:movie_app/presentation/screens/home/view_model/home_cubit.dart';
import 'package:movie_app/presentation/screens/home/views/widget/genres_list_widget.dart';
import 'package:movie_app/presentation/screens/home/views/widget/new_playing_widget.dart';

class MovieShowView extends StatelessWidget {
  const MovieShowView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener:(context,state){},
      builder:(context,state)
      {
        HomeCubit cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text ('Movie Shows'),
            ),
            body: ListView(
              children:  [
                cubit.movieModel == null ?  Container(): NewPlayingWidget(movieModel: cubit.movieModel),
                cubit.genreModel == null ?  Container() :GenreLists(genres: cubit.genreModel!.genres!),
              ],
            ),
          );
      } ,
    );
}
}