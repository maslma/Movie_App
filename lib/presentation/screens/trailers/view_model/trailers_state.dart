abstract class TrailersState {}

class TrailersInitial extends TrailersState {}

class HomeGetMoviesLoadingState extends TrailersState {}
class HomeGetMoviesSuccessState extends TrailersState {}
class HomeGetMoviesErrorState extends TrailersState {
  String? error;
  HomeGetMoviesErrorState(this.error);
}
class HomeGetGenreLoadingState extends TrailersState {}
class HomeGetGenreSuccessState extends TrailersState {}
class HomeGetGenreErrorState extends TrailersState {
  String? error;
  HomeGetGenreErrorState(this.error);
}
class HomeGetDiscoverLoadingState extends TrailersState {}
class HomeGetDiscoverSuccessState extends TrailersState {}
class HomeGetDiscoverErrorState extends TrailersState {
  String? error;
  HomeGetDiscoverErrorState(this.error);
}
class HomeGetTypeMoviesLoadingState extends TrailersState {}
class HomeGetTypeMoviesSuccessState extends TrailersState {}
class HomeGetTypeMoviesErrorState extends TrailersState {
  String? error;
  HomeGetTypeMoviesErrorState(this.error);
}

class HomeGetDetailsMoviesLoadingState extends TrailersState {}
class HomeGetDetailsMoviesSuccessState extends TrailersState {}
class HomeGetDetailsMoviesErrorState extends TrailersState {
  String? error;
  HomeGetDetailsMoviesErrorState(this.error);
}
