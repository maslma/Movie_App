import 'package:flutter/material.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Watch Lists'),
      ),
      // FutureBuilder<MovieModel>(
      //     future: HttpRequest.getMovies('popular'),
      //   builder: (BuildContext context,AsyncSnapshot<MovieModel>snapshot)
      //   {
      //     if(snapshot.hasData)
      //     {
      //       return buildContentWidget(snapshot.data);
      //     }
      //     return Container();
      //   },
      // ),
    );
  }
}
// Widget buildContentWidget(MovieModel?movieModel) {
//   return Container(
//     child: Center(
//       child: Text("${movieModel!.movies![0].title}"),
//     ),
//   );
// }