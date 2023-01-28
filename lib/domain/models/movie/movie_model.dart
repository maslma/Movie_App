//now, i started with create JSON model, movie and TV
//so now, i started to create JSON model
//as you can see, i have to folders movie and tv
//and i will create JSON model and details model for both movie and tv
//let's start with movie model
class MovieModel {
  final List<Movie>? movies;
  final String? error;

  MovieModel({this.movies, this.error});

  factory MovieModel.fromJson(Map<String, dynamic> json)=>
      MovieModel(
        movies: (json['results'] as List)
            .map((data) => Movie.fromJson(data))
            .toList(),
        error: "",
      );

//this model is in case the is error return from api
  factory MovieModel.withError(String error)=>
      MovieModel(
        movies: [],
        error: error,
      );
}
//the parameter "results", is from tmdb api
//all these parameters you may found in tmdb api website
//just retrieve whatever you need
//let create Movie model
  class Movie {
  int? id;
  double? rating;
  String? title;
  String? backDrop;
  String? poster;
  String? overview;

  Movie({
  this.id,
  this.rating,
  this.title,
  this.backDrop,
  this.poster,
  this.overview,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
  id: json['id'],
  rating: json['vote_average'].toDouble(),
  title: json['title'],
  backDrop: json['backdrop_path'],
  poster: json['poster_path'],
  overview: json['overview'],
  );
}