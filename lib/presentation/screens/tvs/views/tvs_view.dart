import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:movie_app/presentation/screens/tvs/views/widget/get_genres_widget.dart';
import 'package:movie_app/presentation/screens/tvs/view_model/tv_cubit.dart';
import 'package:movie_app/presentation/screens/tvs/view_model/tv_state.dart';
import 'package:movie_app/presentation/screens/tvs/views/widget/airing_today_widget.dart';
import 'package:movie_app/presentation/screens/tvs/views/widget/tv_widget.dart';


class TVsView extends StatelessWidget {
  const TVsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TvCubit,TvState>(
      listener:(context,state){},
      builder:(context,state)
      {
        return Scaffold(
          appBar: AppBar(
            title: const Text ('TV Shows'),
            elevation: 0.0,
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children:   [
              const AiringTodayWidget(),
              const GetGenresWidget(),
              const TvsWidget(text: 'UPCOMING', request: 'on_the_air'),
              const TvsWidget(text: 'POPULAR', request: 'popular'),
              const TvsWidget(text: 'TOP RATED',request: 'top_rated'),
              SizedBox(height: 40.h,)

            ],
          ),

        );
      } ,
    );

  }
}
