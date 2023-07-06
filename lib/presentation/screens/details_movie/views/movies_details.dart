import 'package:flutter/material.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:movie_app/presentation/screens/details_movie/views/widget/reviews_widget.dart';
import 'package:movie_app/presentation/screens/details_movie/views/widget/similar_movie_widget.dart';
import 'package:movie_app/presentation/screens/home/view_model/home_cubit.dart';
import 'package:movie_app/presentation/screens/details_movie/views/widget/movie_info_widget.dart';
import 'package:movie_app/presentation/screens/trailers/views/trailers_view.dart';

class MoviesDetails extends StatefulWidget {
  const MoviesDetails({Key? key, required this.movie, this.request})
      : super(key: key);
  final Movie movie;
  final String? request;

  @override
  State<MoviesDetails> createState() => _MoviesDetailsState();
}

class _MoviesDetailsState extends State<MoviesDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              widget.movie.title!,
              overflow: TextOverflow.ellipsis,
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios_outlined)),
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                              "https://image.tmdb.org/t/p/original${widget.movie.backdropPath}",
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      top: 160.h,
                      left: 30.w,
                      child: Hero(
                        tag:widget.request == null
                            ? "${widget.movie.id}"
                            : "${widget.movie.id}${widget.request!}",
                        child: Container(
                          height: 180.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://image.tmdb.org/t/p/original${widget.movie.posterPath}",
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                MovieInfoWidget(id: widget.movie.id!),
                SizedBox(
                  height: 10.h,
                ),
                SimilarMovieWidget(
                  id: widget.movie.id!,
                ),
                ReviewsWidget(
                  id: widget.movie.id!,
                  request: "movie",
                ),
              ],
            ),
          ),
          persistentFooterButtons: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.redAccent,
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) =>
                              TrailersView(shows: "movie", id: widget.movie.id!),
                        ));
                      },
                      icon:  Icon(
                        Icons.play_circle_fill_rounded,
                        size: 30.sp,
                        color: Colors.white,
                      ),
                      label:  Text(
                        'Watch Trailers',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: ColorManager.secondColor,
                    child: TextButton.icon(
                      onPressed: () {
                        // if (widget.hiveId == null) {
                        //   HiveMovieModel newValue = HiveMovieModel(
                        //     id: widget.movie.id!,
                        //     rating: widget.movie.rating!,
                        //     title: widget.movie.title!,
                        //     backDrop: widget.movie.backDrop!,
                        //     poster: widget.movie.poster!,
                        //     overview: widget.movie.overview!,
                        //   );
                        //   _movieWatchLists.add(newValue);
                        //   _showAlertDialog();
                        // }
                        // if (widget.hiveId != null) {
                        //   _movieWatchLists.deleteAt(widget.hiveId!);
                        //   Navigator.of(context).pop(true);
                        // }
                      },
                      icon: Icon(
                        // widget.hiveId == null ?
                        Icons.list_alt_outlined,
                            // : Icons.delete,
                        size: 30.sp,
                        color: Colors.white,
                      ),
                      label: Text(
                        // widget.hiveId == null?
                        'Add To Lists' ,
                            // : 'Delete This',
                        style:  TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],

        );
      },
    );
  }
}
