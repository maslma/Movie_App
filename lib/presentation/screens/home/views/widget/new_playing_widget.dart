// ignore_for_file: must_be_immutable

import 'package:flutter/widgets.dart';
import 'package:movie_app/domain/models/movie/movie_model.dart';
import 'package:movie_app/presentation/presentation_managers/color_manager.dart';
import 'package:page_indicator/page_indicator.dart';

class NewPlayingWidget extends StatelessWidget {
   NewPlayingWidget({Key? key}) : super(key: key);
   MovieModel? movieModel;
   @override
  Widget build(BuildContext context) {

     if (movieModel!.movies!.isEmpty) {
       return SizedBox(
         width: MediaQuery.of(context).size.width,
         height: 220,
         child: const Center(
           child: Text(
             'No Movies found',
             style: TextStyle(
               fontSize: 20,
               color: ColorManager.textColor,
             ),
           ),
         ),
       );
     } else {
       return SizedBox(
         height: 220,
         child: PageIndicatorContainer(
           align: IndicatorAlign.bottom,
           indicatorSpace: 8,
           padding: const EdgeInsets.all(5),
           indicatorColor: ColorManager.textColor,
           indicatorSelectorColor: ColorManager.secondColor,
           length: movieModel!.movies!.take(5).length,
           shape: IndicatorShape.circle(size: 10),
           child: PageView.builder(
             scrollDirection: Axis.horizontal,
             itemCount: movieModel!.movies!.take(5).length,
             itemBuilder: (context, index) {
               return Stack(
                 children: <Widget>[
                   Container(
                     width: MediaQuery.of(context).size.width,
                     height: 220,
                     decoration: BoxDecoration(
                       shape: BoxShape.rectangle,
                       image: DecorationImage(
                         image: NetworkImage(
                             "https://image.tmdb.org/t/p/original${movieModel!.movies![index].backDrop!}"),
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
                     bottom: 30.0,
                     child: Container(
                       padding: const EdgeInsets.only(left: 10, right: 10),
                       width: 250,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Text(
                             movieModel!.movies![index].title!,
                             style:  TextStyle(
                               height: 1.5,
                               color: ColorManager.white,
                               fontWeight: FontWeight.bold,
                               fontSize: 16,
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
}
