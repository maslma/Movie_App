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
class HomeGetUpcomingLoadingState extends HomeState {}
class HomeGetUpcomingSuccessState extends HomeState {}
class HomeGetUpcomingErrorState extends HomeState {
  String? error;
  HomeGetUpcomingErrorState(this.error);
}
