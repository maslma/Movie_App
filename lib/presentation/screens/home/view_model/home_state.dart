abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeGetMoviesLoadingState extends HomeState {}
class HomeGetMoviesSuccessState extends HomeState {}
class HomeGetMoviesErrorState extends HomeState {
  String? error;
  HomeGetMoviesErrorState(this.error);
}
class HomeGetGenreLoadingState extends HomeState {}
class HomeGetGenreSuccessState extends HomeState {}
class HomeGetGenreErrorState extends HomeState {
  String? error;
  HomeGetGenreErrorState(this.error);
}
class HomeGetDiscoverLoadingState extends HomeState {}
class HomeGetDiscoverSuccessState extends HomeState {}
class HomeGetDiscoverErrorState extends HomeState {
  String? error;
  HomeGetDiscoverErrorState(this.error);
}
class HomeGetTypeMoviesLoadingState extends HomeState {}
class HomeGetTypeMoviesSuccessState extends HomeState {}
class HomeGetTypeMoviesErrorState extends HomeState {
  String? error;
  HomeGetTypeMoviesErrorState(this.error);
}

class HomeGetDetailsMoviesLoadingState extends HomeState {}
class HomeGetDetailsMoviesSuccessState extends HomeState {}
class HomeGetDetailsMoviesErrorState extends HomeState {
  String? error;
  HomeGetDetailsMoviesErrorState(this.error);
}
