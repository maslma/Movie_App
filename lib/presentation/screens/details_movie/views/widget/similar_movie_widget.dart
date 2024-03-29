import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/presentation/global_widgets/error_widget.dart';
import 'package:movie_app/presentation/global_widgets/loading_widget.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:movie_app/presentation/screens/details_movie/views/movies_details.dart';
import 'package:movie_app/presentation/screens/home/view_model/home_cubit.dart';

class SimilarMovieWidget extends StatelessWidget {
  final int id;
  const SimilarMovieWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return FutureBuilder<MovieModel>(
          future: cubit.getSimilarMovies(id),
          builder: (context, AsyncSnapshot<MovieModel> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.error != null &&
                  snapshot.data!.error!.isNotEmpty)
              {
                return GlobalErrorWidget(error:snapshot.data!.error );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, top: 5.h),
                    child: Text(
                      "SIMIALR MOVIES",
                      style: TextStyle(
                        color: ColorManager.textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    height: 270.h,
                    padding: EdgeInsets.only(left: 10.w),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.movies!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            top: 10.h,
                            bottom: 10.h,
                            right: 10.w,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true)
                                  .push(
                                MaterialPageRoute(
                                  builder: (context) =>   MoviesDetails(
                                    movie: snapshot.data!.movies![index],
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              children: <Widget>[
                                Hero(
                                  tag:
                                  "${snapshot.data!.movies![index].id}",
                                  child: Container(
                                    width: 120.w,
                                    height: 180.h,
                                    decoration: BoxDecoration(
                                      color: ColorManager.secondColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(2.r)),
                                      shape: BoxShape.rectangle,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "https://image.tmdb.org/t/p/w220_and_h330_face${snapshot.data!.movies![index].posterPath}"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                  width: 100.w,
                                  child: Text(
                                    snapshot.data!.movies![index].title!,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      height: 1.4.h,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      snapshot
                                          .data!.movies![index].voteAverage
                                          .toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    RatingBar.builder(
                                      itemSize: 8,
                                      initialRating: snapshot.data!
                                          .movies![index].voteAverage! /
                                          2,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: EdgeInsets.symmetric(
                                          horizontal: 2.w),
                                      itemBuilder: (context, _) {
                                        return const Icon(
                                          Icons.star,
                                          color: ColorManager.secondColor,
                                        );
                                      },
                                      onRatingUpdate: (rating) {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }else if(snapshot.hasError)
            {
              return GlobalErrorWidget(error:snapshot.error );
            }else
            {
              return const GlobalLoadingWidget();
            }
          },
        );
      },
    );
  }
}
