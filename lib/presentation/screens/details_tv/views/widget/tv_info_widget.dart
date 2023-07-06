import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/domain/models/tv/tv_details_model.dart';
import 'package:movie_app/presentation/global_widgets/error_widget.dart';
import 'package:movie_app/presentation/global_widgets/loading_widget.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:movie_app/presentation/screens/details_movie/views/widget/genre_list_widget.dart';
import 'package:movie_app/presentation/screens/tvs/view_model/tv_cubit.dart';
import 'package:movie_app/presentation/screens/tvs/view_model/tv_state.dart';

import 'over_view_widget.dart';

class TvInfoWidget extends StatelessWidget {
  final int id;
  const TvInfoWidget({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TvCubit, TvState>(
      listener: (context, state) {},
      builder: (context, state) {
        TvCubit cubit = TvCubit.get(context);
        return FutureBuilder<TVDetailsModel>(
          future: cubit.getTVShowsDetails(id),
          builder: (context, AsyncSnapshot<TVDetailsModel> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.error != null &&
                  snapshot.data!.error!.isNotEmpty) {
                return GlobalErrorWidget(error: snapshot.data!.error);
              }
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 120.h,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 130.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 22.w, top: 20.h),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        snapshot.data!.details!.rating!
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      RatingBar.builder(
                                        itemSize: 20,
                                        initialRating:
                                            snapshot.data!.details!.rating! / 2,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 2.w),
                                        itemBuilder: (context, index) {
                                          return const Icon(
                                            Icons.star,
                                            color: ColorManager.secondColor,
                                          );
                                        },
                                        onRatingUpdate: (rating) {},
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 22.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "TOTAL EPISODES",
                                            style: TextStyle(
                                              color: ColorManager.textColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            '${snapshot.data!.details!.numberOfEpisodes!}',
                                            style: TextStyle(
                                              color: ColorManager.secondColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "AIRING DATE",

                                            style: TextStyle(
                                              color: ColorManager.textColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            snapshot
                                                .data!.details!.firstAirDate!,
                                            style: TextStyle(
                                              color: ColorManager.secondColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  OverViewWidget(
                    overview: snapshot.data!.details!.overview!,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GenreListWidget(
                    genres: snapshot.data!.details!.genres!,
                  ),
                ],
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
