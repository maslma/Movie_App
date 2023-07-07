import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/domain/models/tv/hive_tv_model.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:movie_app/presentation/screens/details_movie/views/movies_details.dart';

class TvWatchLists extends StatefulWidget {
  const TvWatchLists({Key? key}) : super(key: key);

  @override
  State<TvWatchLists> createState() => _TvWatchListsState();
}

class _TvWatchListsState extends State<TvWatchLists> {
  late Box<HiveTVModel> _tvWatchLists;

  @override
  void initState() {
    _tvWatchLists = Hive.box<HiveTVModel>('tv_lists');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: _tvWatchLists.isEmpty
          ? Center(
              child: Text(
                "No Tv shows added to list yet!",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.textColor,
                ),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ValueListenableBuilder(
                    valueListenable: _tvWatchLists.listenable(),
                    builder: (context, Box<HiveTVModel> item, _) {
                      List<int> keys = item.keys.cast<int>().toList();
                      return ListView.builder(
                        itemCount: keys.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final key = keys[index];
                          final HiveTVModel? _item = item.get(key);
                          return Card(
                            elevation: 5,
                            child: ListTile(
                              onTap: () async {
                                Movie _movie = Movie();
                                _movie.id = _item.id;
                                _movie.title = _item.name;
                                _movie.overview = _item.overview;
                                _movie.backdropPath = _item.backDrop;
                                _movie.posterPath = _item.poster;
                                _movie.voteAverage = _item.rating;

                                final refresh = await Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) {
                                  return MoviesDetails(
                                    movie: _movie,
                                    hiveId: index,
                                  );
                                }));
                                if (refresh) {
                                  setState(() {});
                                }
                              },
                              title: Text(_item!.name),
                              subtitle: Text(
                                _item.overview,
                                overflow: TextOverflow.ellipsis,
                              ),
                              leading: Image.network(
                                "https://image.tmdb.org/t/p/w200/${_item.poster}",
                                fit: BoxFit.cover,
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    _tvWatchLists.deleteAt(index);
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
