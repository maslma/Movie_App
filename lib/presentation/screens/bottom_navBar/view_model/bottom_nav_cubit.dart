import 'package:flutter/material.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:movie_app/presentation/screens/tvs/views/tvs_view.dart';
import 'package:movie_app/presentation/screens/watch/views/watch_list_view.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavInitial());

  static BottomNavCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
     const HomeView(),
    const TVsView(),
   const WatchListView()
  ];
  List<PersistentBottomNavBarItem> items = [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.movie),
      title: "Movies",
      activeColorPrimary: ColorManager.secondColor,
      inactiveColorPrimary: ColorManager.textColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.tv),
      title: "TVs",
      activeColorPrimary: ColorManager.secondColor,
      inactiveColorPrimary: ColorManager.textColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.list),
      title: "Watch Lists",
      activeColorPrimary: ColorManager.secondColor,
      inactiveColorPrimary: ColorManager.textColor,
    ),

  ];
}
