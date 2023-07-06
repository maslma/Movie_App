import 'package:flutter/material.dart';
import 'package:movie_app/domain/models/trailers_model.dart';
import 'package:movie_app/presentation/global_widgets/error_widget.dart';
import 'package:movie_app/presentation/global_widgets/loading_widget.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:movie_app/presentation/screens/trailers/view_model/trailers_cubit.dart';
import 'package:movie_app/presentation/screens/trailers/view_model/trailers_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailersView extends StatelessWidget {
  const TrailersView({super.key, required this.shows, required this.id});
  final String shows;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrailersCubit, TrailersState>(
      listener: (context, state) {},
      builder: (context, state) {
        TrailersCubit cubit = TrailersCubit.get(context);
        return FutureBuilder<TrailersModel>(
            future: cubit.getTrailers(shows,id),
            builder: (context, AsyncSnapshot<TrailersModel> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.error != null &&
                    snapshot.data!.error!.isNotEmpty) {
                  return GlobalErrorWidget(error: snapshot.data!.error);
                }
                return Stack(
                  children: <Widget>[
                    Center(
                      child: YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId:snapshot.data!.trailers!.isNotEmpty ?snapshot.data!.trailers![0].key! :'Invaild Value',
                          flags: const YoutubePlayerFlags(
                            hideControls: true,
                            autoPlay: true,
                          ),
                        ),
                      ),
                    ),
                    //close button
                    Positioned(
                      top: 40.h,
                      right: 20.w,
                      child: GestureDetector(
                          onTap: ()
                          {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(Icons.close_sharp, color: Colors.white,)),
                      ),
                  ],
                );
              } else if (snapshot.hasError) {
                return GlobalErrorWidget(error: snapshot.error);
              } else {
                return const GlobalLoadingWidget();
              }
            });
      },
    );
  }
}
