import 'package:flutter/material.dart';
import 'package:movie_app/domain/models/genres_model.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';

class GenreListWidget extends StatelessWidget {
  final List<Genres> genres;
  const GenreListWidget({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            "GENRES",
            style: TextStyle(
              color: ColorManager.textColor,
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
            ),
          ),
          Container(
            height: 35.h,
            padding:  EdgeInsets.only(top: 10.h),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: genres.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:  EdgeInsets.only(right: 10.w),
                  child: Container(
                    padding:  const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius:  BorderRadius.all(Radius.circular(5.r)),
                      border: Border.all(width: 1, color: Colors.white),
                    ),
                    child: Text(
                      genres[index].name!,
                      style:  TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 9.sp,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
