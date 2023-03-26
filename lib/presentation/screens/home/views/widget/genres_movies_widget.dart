import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:movie_app/presentation/screens/home/view_model/home_cubit.dart';

class GenreMovies extends StatelessWidget {
  const GenreMovies({Key? key, required this.genreId}) : super(key: key);
  final int genreId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return Container(
          height: 300.h,
          padding: const EdgeInsets.only(left: 10),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount:cubit.movieModel == null ? 0 : cubit.movieModel!.movies!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:  EdgeInsets.only(
                  top: 10.h,
                  bottom: 10.h,
                  right: 10.w,
                ),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (_) =>
                    //         MoviesDetailsScreen(movie: movies![index])));
                  },
                  child: Column(
                    children: <Widget>[
                      cubit.movieModel!.movies![index].posterPath == null
                          ? Container(
                              width: 120.w,
                              height: 180.h,
                              decoration: const BoxDecoration(
                                color: ColorManager.secondColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2)),
                                shape: BoxShape.rectangle,
                              ),
                              child:  Center(
                                child: Icon(
                                  Icons.videocam_off,
                                  color: Colors.white,
                                  size: 50.r,
                                ),
                              ),
                            )
                          : Hero(
                              tag: '${cubit.movieModel!.movies![index].id}',
                              child: Container(
                                width: 120.w,
                                height: 180.h,
                                decoration: BoxDecoration(
                                  color: ColorManager.secondColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(2)),
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://image.tmdb.org/t/p/w220_and_h330_face${cubit.movieModel!.movies![index].posterPath}"),
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
                          cubit.movieModel!.movies![index].title!,
                          overflow: TextOverflow.ellipsis,
                          style:  TextStyle(
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
                            cubit.movieModel!.movies![index].voteAverage.toString(),
                            style:  TextStyle(
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
                            initialRating: cubit.movieModel!.movies![index].voteCount! / 2,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 2),
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
        );
      },
    );
  }
}
