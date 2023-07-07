import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/domain/models/movie/hive_movie_model.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:movie_app/presentation/screens/details_movie/views/movies_details.dart';

class MovieWatchLists extends StatefulWidget {
  const MovieWatchLists({Key? key}) : super(key: key);

  @override
  State<MovieWatchLists> createState() => _MovieWatchListsState();
}

class _MovieWatchListsState extends State<MovieWatchLists> {
  late Box<HiveMovieModel> _movieWatchLists;

  @override
  void initState() {
    _movieWatchLists = Hive.box<HiveMovieModel>('movie_lists');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: _movieWatchLists.isEmpty
          ? Center(
              child: Text(
                "No Movies added to list yet!",
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
                    valueListenable: _movieWatchLists.listenable(),
                    builder: (context, Box<HiveMovieModel> item, _) {
                      List<int> keys = item.keys.cast<int>().toList();
                      return ListView.builder(
                        itemCount: keys.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final key = keys[index];
                          final HiveMovieModel? _item = item.get(key);
                          return Card(
                            elevation: 5,
                            child: ListTile(
                              onTap: () async {
                                Movie _movie = Movie();
                                _movie.id = _item.id;
                                _movie.title = _item.title;
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
                              title: Text(_item!.title),
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
                                    _movieWatchLists.deleteAt(index);
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
