import 'package:flutter/material.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';

class MoviesDetails extends StatelessWidget {
  const MoviesDetails({Key? key, required this.movie,this.request}) : super(key: key);
  final Movie movie;
  final String? request;

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
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 200.h,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/original${movie.backdropPath}",
                    ),
                    fit: BoxFit.cover
                  ),
                ),
              ),
              Positioned(
                  top: 160.h,
                  left: 30.w,
                  child:  Hero(
                    tag: request == null ?  "${movie.id}" :"${movie.id}$request",
                    child: Container(
                      height: 180.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: NetworkImage(
                              "https://image.tmdb.org/t/p/original${movie.posterPath}",
                            ),
                            fit: BoxFit.cover
                        ),
                      ),
                    ),
                  ),)
            ],
          )
        ],
      ),
    );
  }
}
