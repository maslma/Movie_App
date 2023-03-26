import 'package:flutter/material.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:shimmer/shimmer.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withAlpha(100),
      highlightColor: Colors.grey.withAlpha(50),
      child: SizedBox(
        height: AppSize.s230.h,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: AppSize.s520.h,
              color: ColorManager.grey.withAlpha(100),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  ColorManager.primaryColor.withOpacity(1),
                  ColorManager.primaryColor.withOpacity(0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.0, 0.9],
              )),
            ),
            Positioned(
              bottom: AppSize.s35,
              child: Container(
                padding: const EdgeInsets.only(
                    left: AppSize.s10, right: AppSize.s10),
                width: AppSize.s225.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: AppSize.s20.h,
                      color: ColorManager.grey.withAlpha(100),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
