import 'package:flutter/material.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';

class OverViewWidget extends StatelessWidget {
  final String overview;
  const OverViewWidget({Key? key,required this.overview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
        top: 20.h,
        bottom: 10.h,
        left: 10.w,
        right: 10.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            "OVERVIEW",
            style: TextStyle(
              color: ColorManager.textColor,
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
            ),
          ),
           SizedBox(
            height: 5.h,
          ),
          Text(
            overview,
            style:  TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              height: 1.5.h,
            ),
          ),
        ],
      ),
    );
  }
}
