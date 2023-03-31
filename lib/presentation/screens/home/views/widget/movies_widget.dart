// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:movie_app/presentation/screens/details/views/movies_details.dart';
import 'package:movie_app/presentation/screens/home/view_model/home_cubit.dart';

class MoviesTypeWidget extends StatelessWidget {
  const MoviesTypeWidget({Key? key, required this.text, required this.request})
      : super(key: key);
  final String text;
  final String request;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()..getTypeMovies(request),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.w, top: 5.h),
                child: Text(
                  "$text MOVIES",
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
                  itemCount: cubit.movieModel == null
                      ? 0
                      : cubit.movieModel!.movies!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        top: 10.h,
                        bottom: 10.h,
                        right: 10.w,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) => MoviesDetails(movie: cubit.movieModel!.movies![index],request: request),
                            ),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Hero(
                              tag:
                                  "${cubit.movieModel!.movies![index].id}$request",
                              child: Container(
                                width: 120.w,
                                height: 180.h,
                                decoration: BoxDecoration(
                                  color: ColorManager.secondColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.r)),
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
                                  cubit.movieModel!.movies![index].voteAverage
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
                                  initialRating: cubit.movieModel!
                                          .movies![index].voteAverage! /
                                      2,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 2.w),
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
              )
            ],
          );
        },
      ),
    );
  }
}
