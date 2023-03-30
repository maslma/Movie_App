import 'package:flutter/material.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';

class MoviesDetails extends StatelessWidget {
  const MoviesDetails({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movie.title!,
          overflow: TextOverflow.ellipsis,
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200.h,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/w220_and_h330_face${movie.backdropPath}",
                    ),
                    fit: BoxFit.fill
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
