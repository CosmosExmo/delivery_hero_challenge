import 'package:flutter/foundation.dart';

@immutable
class MovieModel {
  final int id;
  final bool adult;
  final List<int> genreIds;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final DateTime? releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final String? backdropPath;
  final String? posterPath;

  const MovieModel({
    required this.id,
    required this.adult,
    required this.genreIds,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    this.releaseDate,
    this.backdropPath,
    this.posterPath,
  });

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: int.parse((map['id'] ?? "0").toString()),
      adult: map['adult'] ?? false,
      backdropPath: map['backdrop_path'],
      genreIds: List<int>.from(map['genre_ids'] ?? []),
      originalLanguage: map['original_language'] ?? '',
      originalTitle: map['original_title'] ?? '',
      overview: map['overview'] ?? '',
      popularity: double.parse((map['popularity'] ?? "0.0").toString()),
      posterPath: map['poster_path'],
      releaseDate: DateTime.tryParse(map['release_date'].toString()),
      title: map['title'] ?? '',
      video: map['video'] ?? false,
      voteAverage: double.parse((map['vote_average'] ?? "0.0").toString()),
      voteCount: int.parse((map['vote_count'] ?? "0").toString()),
    );
  }

  MovieModel copyWith({
    int? id,
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    DateTime? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) {
    return MovieModel(
      id: id ?? this.id,
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      genreIds: genreIds ?? this.genreIds,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieModel &&
        other.id == id &&
        other.adult == adult &&
        other.backdropPath == backdropPath &&
        listEquals(other.genreIds, genreIds) &&
        other.originalLanguage == originalLanguage &&
        other.originalTitle == originalTitle &&
        other.overview == overview &&
        other.popularity == popularity &&
        other.posterPath == posterPath &&
        other.releaseDate == releaseDate &&
        other.title == title &&
        other.video == video &&
        other.voteAverage == voteAverage &&
        other.voteCount == voteCount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        adult.hashCode ^
        backdropPath.hashCode ^
        genreIds.hashCode ^
        originalLanguage.hashCode ^
        originalTitle.hashCode ^
        overview.hashCode ^
        popularity.hashCode ^
        posterPath.hashCode ^
        releaseDate.hashCode ^
        title.hashCode ^
        video.hashCode ^
        voteAverage.hashCode ^
        voteCount.hashCode;
  }
}
