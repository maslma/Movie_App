import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/domain/models/tv/tv_model.dart';
import 'package:movie_app/presentation/global_widgets/error_widget.dart';
import 'package:movie_app/presentation/global_widgets/loading_widget.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:movie_app/presentation/screens/details_tv/views/tv_details.dart';
import 'package:movie_app/presentation/screens/tvs/view_model/tv_cubit.dart';
import 'package:movie_app/presentation/screens/tvs/view_model/tv_state.dart';

class GenreTv extends StatelessWidget {
  const GenreTv({Key? key, required this.genreId}) : super(key: key);
  final int genreId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TvCubit, TvState>(
      listener: (context, state) {},
      builder: (context, state) {
        TvCubit cubit = TvCubit.get(context);
        return FutureBuilder<TVModel>(
          future: cubit.getDiscoverTVShows(genreId),
          builder: (context, AsyncSnapshot<TVModel> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.error != null &&
                  snapshot.data!.error!.isNotEmpty) {
                return GlobalErrorWidget(error: snapshot.data!.error);
              }
              return Container(
                height: 270.h,
                padding: const EdgeInsets.only(left: 10),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.tvShows!.length,
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
                              builder: (context) => TvDetails(
                                  tvShows: snapshot.data!.tvShows![index]),
                            ),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Hero(
                              tag: '${snapshot.data!.tvShows![index].id}',
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
                                        "https://image.tmdb.org/t/p/w220_and_h330_face${snapshot.data!.tvShows![index].poster}"),
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
                                snapshot.data!.tvShows![index].name!,
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
                                  snapshot.data!.tvShows![index].rating
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
                                  initialRating: snapshot
                                          .data!.tvShows![index].rating! /
                                      2,
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
            } else if (snapshot.hasError) {
              return GlobalErrorWidget(error: snapshot.error);
            } else {
              return const GlobalLoadingWidget();
            }
          },
        );
      },
    );
  }
}
