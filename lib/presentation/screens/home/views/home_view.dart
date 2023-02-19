import 'package:flutter/material.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:movie_app/presentation/screens/home/view_model/home_cubit.dart';
import 'package:movie_app/presentation/screens/home/views/widget/loading_indicator.dart';
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
            body: Column(
              children:  [
                Text('New Playing',
                  style: TextStyle(
                    color: ColorManager.textColor,
                  ),),
                cubit.movieModel == null ? LoadingIndicator() : NewPlayingWidget(),
              ],
            ),
          );
      } ,
    );
}
}