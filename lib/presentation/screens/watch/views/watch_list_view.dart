import 'package:flutter/material.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:movie_app/presentation/screens/home/views/widget/movie_watch_lists.dart';
import 'package:movie_app/presentation/screens/tvs/views/widget/tv_watch_lists.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text ('Watch Lists'),
          bottom:  TabBar(
            indicatorWeight: 4,
            indicatorColor: ColorManager.secondColor,
            tabs: [
              Text('Movies',
                  style: TextStyle(
                    fontSize: 20.sp,
                  )),
              Text('TVs',
                  style: TextStyle(
                    fontSize: 20.sp,
                  )),
            ],
          ),
          elevation: 0.0,
        ),
        body: const TabBarView(
          children: <Widget>[
            MovieWatchLists(),
            TvWatchLists(),
          ],
        ),
      ),
    );

  }
}
