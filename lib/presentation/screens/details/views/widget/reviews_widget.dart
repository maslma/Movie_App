import 'package:flutter/material.dart';
import 'package:movie_app/domain/models/reviews_model.dart';
import 'package:movie_app/presentation/global_widgets/error_widget.dart';
import 'package:movie_app/presentation/global_widgets/loading_widget.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:movie_app/presentation/screens/home/view_model/home_cubit.dart';

class ReviewsWidget extends StatelessWidget {
  final int id;
  final String request;
  const ReviewsWidget({super.key, required this.id, required this.request});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.w, top: 10.h),
                child: Text(
                  "REVIEWS",
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
              FutureBuilder<ReviewsModel>(
                future: cubit.getReviews(request, id),
                builder: (context, AsyncSnapshot<ReviewsModel> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.error != null &&
                        snapshot.data!.error!.isNotEmpty) {
                      return GlobalErrorWidget(error: snapshot.data!.error);
                    }
                    return Column(
                      children: List.generate(snapshot.data!.reviews!.length,
                          (index) {
                        return Card(
                          color: ColorManager.textColor,
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          elevation: 5,
                          child: ListTile(
                            title: Text(
                              snapshot.data!.reviews![index].content!,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }),
                    );
                  } else if (snapshot.hasError) {
                    return GlobalErrorWidget(error: snapshot.error);
                  } else {
                    return const GlobalLoadingWidget();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
