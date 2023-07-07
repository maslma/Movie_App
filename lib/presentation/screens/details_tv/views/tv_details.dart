import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movie_app/domain/models/tv/hive_tv_model.dart';
import 'package:movie_app/domain/models/tv/tv_model.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:movie_app/presentation/screens/details_movie/views/widget/reviews_widget.dart';
import 'package:movie_app/presentation/screens/details_tv/views/widget/similar_tv_widget.dart';
import 'package:movie_app/presentation/screens/details_tv/views/widget/tv_info_widget.dart';
import 'package:movie_app/presentation/screens/trailers/views/trailers_view.dart';
import 'package:movie_app/presentation/screens/tvs/view_model/tv_cubit.dart';
import 'package:movie_app/presentation/screens/tvs/view_model/tv_state.dart';

class TvDetails extends StatefulWidget {
  const TvDetails({Key? key, required this.tvShows, this.request, this.hiveId})
      : super(key: key);
  final TVShows tvShows;
  final String? request;
  final int? hiveId;


  @override
  State<TvDetails> createState() => _TvDetailsState();
}

class _TvDetailsState extends State<TvDetails> {
  late Box<HiveTVModel> _tvWatchLists;

  @override
  void initState() {
    _tvWatchLists = Hive.box<HiveTVModel>('tv_lists');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TvCubit, TvState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              widget.tvShows.name!,
              overflow: TextOverflow.ellipsis,
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios_outlined)),
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 200.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: NetworkImage(
                              "https://image.tmdb.org/t/p/original${widget.tvShows.backDrop}",
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      top: 160.h,
                      left: 30.w,
                      child: Hero(
                        tag: widget.request == null
                            ? "${widget.tvShows.id}"
                            : "${widget.tvShows.id}${widget.request!}",
                        child: Container(
                          height: 180.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://image.tmdb.org/t/p/original${widget.tvShows.poster}",
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                TvInfoWidget(id: widget.tvShows.id!),
                SizedBox(
                  height: 10.h,
                ),
                SimilarTvWidget(
                  id: widget.tvShows.id!,
                ),
                ReviewsWidget(
                  id: widget.tvShows.id!,
                  request: "tv",
                ),
              ],
            ),
          ),
          persistentFooterButtons: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.redAccent,
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) =>
                              TrailersView(shows: "tv", id: widget.tvShows.id!),
                        ));
                      },
                      icon: Icon(
                        Icons.play_circle_fill_rounded,
                        size: 30.sp,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Watch Trailers',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: ColorManager.secondColor,
                    child: TextButton.icon(
                      onPressed: () {
                        if (widget.hiveId == null) {
                          HiveTVModel newValue = HiveTVModel(
                            id: widget.tvShows.id!,
                            rating: widget.tvShows.rating!,
                            name: widget.tvShows.name!,
                            backDrop: widget.tvShows.backDrop!,
                            poster: widget.tvShows.poster!,
                            overview: widget.tvShows.overview!,
                          );
                          _tvWatchLists.add(newValue);
                          _showAlertDialog();
                        }
                        if (widget.hiveId != null) {
                          _tvWatchLists.deleteAt(widget.hiveId!);
                          Navigator.of(context).pop(true);
                        }
                      },
                      icon: Icon(
                        // widget.hiveId == null ?
                        Icons.list_alt_outlined,
                        // : Icons.delete,
                        size: 30.sp,
                        color: Colors.white,
                      ),
                      label: Text(
                        // widget.hiveId == null?
                        'Add To Lists',
                        // : 'Delete This',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Added to List"),
          content:
          Text("${widget.tvShows.name!} successfully added to watch list"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }

}
