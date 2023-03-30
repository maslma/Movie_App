import 'package:flutter/material.dart';

class TVsView extends StatelessWidget {
  const TVsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('TV Shows'),
        elevation: 0.0,
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