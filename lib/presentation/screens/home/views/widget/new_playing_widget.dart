// ignore_for_file: must_be_immutable
import 'package:movie_app/presentation/global_widgets/error_widget.dart';
import 'package:movie_app/presentation/global_widgets/loading_widget.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:movie_app/presentation/screens/home/view_model/home_cubit.dart';

class NewPlayingWidget extends StatelessWidget {
  const NewPlayingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return FutureBuilder<MovieModel>(
          future: cubit.getMovies("now_playing"),
          builder: (context, AsyncSnapshot<MovieModel> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.error != null &&
                  snapshot.data!.error!.isNotEmpty) {
                return GlobalErrorWidget(error: snapshot.data!.error);
              }
              return SizedBox(
                height: AppSize.s230.h,
                child: PageIndicatorContainer(
                  align: IndicatorAlign.bottom,
                  indicatorSpace: 8,
                  padding: const EdgeInsets.all(5),
                  indicatorColor: ColorManager.textColor,
                  indicatorSelectorColor: ColorManager.secondColor,
                  length: snapshot.data!.movies!.take(5).length,
                  shape: IndicatorShape.circle(size: AppSize.s10.r),
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.movies!.take(5).length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/original${snapshot.data!.movies![index].backdropPath}"),
                                fit: BoxFit.cover,
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
                                    snapshot.data!.movies![index].title!,
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
            }else if(snapshot.hasError)
            {
              return GlobalErrorWidget(error:snapshot.error );
            }else
            {
              return const GlobalLoadingWidget();
            }
          },
        );
      },
    );
  }
}
