//this movie details model.
//is to return details of particular movie
//with its id

import 'package:movie_app/domain/models/genres_model.dart';

class MovieDetailsModel {
  final MovieDetails? details;
  final String? error;

  MovieDetailsModel({this.details, this.error});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        details: MovieDetails.fromJson(json),
        error: "",
      );

  factory MovieDetailsModel.withError(String error) => MovieDetailsModel(
    details: MovieDetails(),
    error: error,
  );
}

class MovieDetails {
  int? id;
  List<Genres>? genres;
  String? releaseDate;
  String? overview;
  String? backDrop;
  String? poster;
  double? rating;
  String? title;
  int? runtime;

  MovieDetails({
    this.id,
    this.genres,
    this.releaseDate,
    this.overview,
    this.backDrop,
    this.poster,
    this.rating,
    this.title,
    this.runtime,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
    id: json['id'],
    genres: (json['genres'] as List)
        .map((genres) => Genres.fromJson(genres))
        .toList(),
    rating: json['vote_average'].toDouble(),
    title: json['title'],
    backDrop: json['backdrop_path'],
    poster: json['poster_path'],
    overview: json['overview'],
    releaseDate: json['release_date'],
    runtime: json['runtime'],
  );
}
//Genre is a category of art or movie/shows
//and later i will create genre model for this
//now, do the same to tv model