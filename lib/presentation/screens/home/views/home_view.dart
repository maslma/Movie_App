import 'package:flutter/material.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:movie_app/presentation/screens/home/view_model/home_cubit.dart';
import 'package:movie_app/presentation/screens/home/views/widget/genres_list_widget.dart';
import 'package:movie_app/presentation/screens/home/views/widget/movies_widget.dart';
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
              elevation: 0.0,
            ),
            body: ListView(
              physics: const BouncingScrollPhysics(),
              children:  [
                cubit.movieModel == null ?  Container(): NewPlayingWidget(movieModel: cubit.movieModel),
                cubit.genreModel == null ?  Container() :GenreLists(genres: cubit.genreModel!.genres!),
                // cubit.movieModel == null ?  Container() : const MoviesTypeWidget(text: 'UPCOMING',request: 'upcoming'),
                cubit.movieModel == null ?  Container() : const MoviesTypeWidget(text: 'POPULAR',request: 'popular'),
                cubit.movieModel == null ?  Container() : const MoviesTypeWidget(text: 'TOP RATED',request: 'top_rated'),
                SizedBox(height: 40.h,)
              ],
            ),

          );
      } ,
    );
}
}