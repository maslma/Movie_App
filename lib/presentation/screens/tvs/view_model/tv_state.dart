abstract class TvState {}

class TvInitial extends TvState {}

class HomeGetMoviesLoadingState extends TvState {}
class HomeGetMoviesSuccessState extends TvState {}
class HomeGetMoviesErrorState extends TvState {
  String? error;
  HomeGetMoviesErrorState(this.error);
}
class HomeGetGenreLoadingState extends TvState {}
class HomeGetGenreSuccessState extends TvState {}
class HomeGetGenreErrorState extends TvState {
  String? error;
  HomeGetGenreErrorState(this.error);
}
class HomeGetDiscoverLoadingState extends TvState {}
class HomeGetDiscoverSuccessState extends TvState {}
class HomeGetDiscoverErrorState extends TvState {
  String? error;
  HomeGetDiscoverErrorState(this.error);
}
class HomeGetTypeMoviesLoadingState extends TvState {}
class HomeGetTypeMoviesSuccessState extends TvState {}
class HomeGetTypeMoviesErrorState extends TvState {
  String? error;
  HomeGetTypeMoviesErrorState(this.error);
}

class HomeGetDetailsMoviesLoadingState extends TvState {}
class HomeGetDetailsMoviesSuccessState extends TvState {}
class HomeGetDetailsMoviesErrorState extends TvState {
  String? error;
  HomeGetDetailsMoviesErrorState(this.error);
}
