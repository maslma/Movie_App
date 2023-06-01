import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:movie_app/presentation/screens/home/view_model/home_cubit.dart';

class MovieInfoWidget extends StatelessWidget {
 final int id;
   const MovieInfoWidget({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){},
      builder: (context,state)
      {
        HomeCubit cubit = HomeCubit.get(context);
        return Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children:[
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
                            padding:  EdgeInsets.only(left: 22.w, top: 20.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  cubit.movieDetails!.rating!.toString() ,
                                  style:  TextStyle(
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
                                  initialRating: cubit.movieDetails!.rating! / 2,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                  EdgeInsets.symmetric(horizontal: 2.w),
                                  itemBuilder: (context, index) {
                                    return  const Icon(
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
                            padding:  EdgeInsets.only(left: 22.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "DURATION",
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
                                      '${cubit.movieDetails!.runtime!} mins',
                                      style:  TextStyle(
                                        color: ColorManager.secondColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 48.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "RELEASE DATE",
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
                                      cubit.movieDetails!.releaseDate!,
                                      style:  TextStyle(
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
          ],
        );
      },
    );
  }
}
