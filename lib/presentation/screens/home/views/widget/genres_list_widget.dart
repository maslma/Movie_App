// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:movie_app/domain/models/genres_model.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:movie_app/presentation/screens/home/views/widget/genres_movies_widget.dart';

class GenreLists extends StatefulWidget {
  GenreLists({Key? key, required this.genres}) : super(key: key);
  List<Genres>? genres;

  @override
  State<GenreLists> createState() => _GenreListsState();
}

class _GenreListsState extends State<GenreLists>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: widget.genres!.length, vsync: this);
    _tabController!.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: DefaultTabController(
        length: widget.genres!.length,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.h),
            child: AppBar(
              bottom: TabBar(
                physics: const BouncingScrollPhysics(),
                controller: _tabController,
                indicatorColor: ColorManager.secondColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3,
                unselectedLabelColor: ColorManager.textColor,
                labelColor: Colors.white,
                isScrollable: true,
                tabs: widget.genres!.map((Genres genre) {
                  return Container(
                    padding: EdgeInsets.only(
                      bottom: 15.h,
                      top: 10.h,
                    ),
                    child: Text(
                      genre.name!.toUpperCase(),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: widget.genres!.map((Genres genre) {
              return GenreMovies(genreId: genre.id!);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
