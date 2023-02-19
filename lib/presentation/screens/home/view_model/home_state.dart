abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeGetMoviesLoadingState extends HomeState {}
class HomeGetMoviesSuccessState extends HomeState {}
class HomeGetMoviesErrorState extends HomeState {
  String? error;
  HomeGetMoviesErrorState(this.error);
}
