import 'package:delivery_hero_challenge/app/blueprints/api_response.dart';
import 'package:flutter/foundation.dart';

class MovieDetailModel extends ApiResponse {
  late MovieDetailData data;

  MovieDetailModel.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    final MovieDetailData data = MovieDetailData.fromMap(map);
    this.data = data;
  }

  MovieDetailModel.withError(String error) : super.withError(error);

  @override
  Map<String, dynamic> toMap() {
    return {};
  }
}

@immutable
class MovieDetailData {
  final int id;
  final bool adult;
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
  final List<MovieGenre> genres;
  final List<MovieProductionCompanie> productionCompanies;

  const MovieDetailData({
    required this.id,
    required this.adult,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    this.backdropPath,
    this.posterPath,
    required this.genres,
    required this.productionCompanies,
  });

  factory MovieDetailData.fromMap(Map<String, dynamic> map) {
    return MovieDetailData(
      id: int.parse((map['id'] ?? "0").toString()),
      adult: map['adult'] ?? false,
      originalLanguage: map['originalLanguage'] ?? '',
      originalTitle: map['originalTitle'] ?? '',
      overview: map['overview'] ?? '',
      popularity: double.parse((map['popularity'] ?? "0.0").toString()),
      releaseDate: DateTime.tryParse(map['releaseDate'].toString()),
      title: map['title'] ?? '',
      video: map['video'] ?? false,
      voteAverage: double.parse((map['vote_average'] ?? "0.0").toString()),
      voteCount: int.parse((map['vote_count'] ?? "0").toString()),
      backdropPath: map['backdropPath'],
      posterPath: map['posterPath'],
      genres: map['genres'] != null
          ? List<MovieGenre>.from(
              (map['genres'] ?? []).map(
                (x) => MovieGenre.fromMap(x),
              ),
            )
          : [],
      productionCompanies: map['production_companies'] != null
          ? List<MovieProductionCompanie>.from(
              (map['production_companies'] ?? [])?.map(
                (x) => MovieProductionCompanie.fromMap(x),
              ),
            )
          : [],
    );
  }

  MovieDetailData copyWith({
    int? id,
    bool? adult,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    DateTime? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
    String? backdropPath,
    String? posterPath,
    List<MovieGenre>? genres,
    List<MovieProductionCompanie>? productionCompanies,
  }) {
    return MovieDetailData(
      id: id ?? this.id,
      adult: adult ?? this.adult,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      backdropPath: backdropPath ?? this.backdropPath,
      posterPath: posterPath ?? this.posterPath,
      genres: genres ?? this.genres,
      productionCompanies: productionCompanies ?? this.productionCompanies,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieDetailData &&
        other.id == id &&
        other.adult == adult &&
        other.originalLanguage == originalLanguage &&
        other.originalTitle == originalTitle &&
        other.overview == overview &&
        other.popularity == popularity &&
        other.releaseDate == releaseDate &&
        other.title == title &&
        other.video == video &&
        other.voteAverage == voteAverage &&
        other.voteCount == voteCount &&
        other.backdropPath == backdropPath &&
        other.posterPath == posterPath &&
        listEquals(other.genres, genres) &&
        listEquals(other.productionCompanies, productionCompanies);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        adult.hashCode ^
        originalLanguage.hashCode ^
        originalTitle.hashCode ^
        overview.hashCode ^
        popularity.hashCode ^
        releaseDate.hashCode ^
        title.hashCode ^
        video.hashCode ^
        voteAverage.hashCode ^
        voteCount.hashCode ^
        backdropPath.hashCode ^
        posterPath.hashCode ^
        genres.hashCode ^
        productionCompanies.hashCode;
  }
}

class MovieGenre {
  final int id;
  final String name;

  const MovieGenre({
    required this.id,
    required this.name,
  });

  factory MovieGenre.fromMap(Map<String, dynamic> map) {
    return MovieGenre(
      id: int.parse((map['id'] ?? "0").toString()),
      name: map['name'] ?? '',
    );
  }
}

class MovieProductionCompanie {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  const MovieProductionCompanie({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory MovieProductionCompanie.fromMap(Map<String, dynamic> map) {
    return MovieProductionCompanie(
      id: int.parse((map['id'] ?? "0").toString()),
      logoPath: map['logo_path'],
      name: map['name'] ?? '',
      originCountry: map['origin_country'] ?? '',
    );
  }
}
