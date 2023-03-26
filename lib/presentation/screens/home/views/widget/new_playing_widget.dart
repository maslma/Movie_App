// ignore_for_file: must_be_immutable
import 'package:movie_app/presentation/presentation_managers/exports.dart';

class NewPlayingWidget extends StatelessWidget {
  NewPlayingWidget({
    Key? key,
    required this.movieModel,
  }) : super(key: key);
  MovieModel? movieModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s230.h,
      child: PageIndicatorContainer(
        align: IndicatorAlign.bottom,
        indicatorSpace: 8,
        padding: const EdgeInsets.all(5),
        indicatorColor: ColorManager.textColor,
        indicatorSelectorColor: ColorManager.secondColor,
        length: movieModel == null ? 0 : movieModel!.movies!.take(5).length,
        shape: IndicatorShape.circle(size: AppSize.s10.r),
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:
              movieModel == null ? 0 : movieModel!.movies!.take(5).length,
          itemBuilder: (context, index) {
            return Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  // height: AppSize.s350.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://image.tmdb.org/t/p/w220_and_h330_face${movieModel!.movies![index].backdropPath}"),
                      fit: BoxFit.fill,
                    ),
                  ),
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
                        Text(
                          movieModel!.movies![index].title!,
                          style: TextStyle(
                            height: AppSize.s1_5.h,
                            color: ColorManager.white,
                            fontWeight: FontWeight.bold,
                            fontSize: AppSize.s16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
