import 'package:delivery_hero_challenge/models/movie_model.dart';

extension MovieModelExtension on MovieModel {
  String get posterImagePath {
    return 'https://image.tmdb.org/t/p/w200$posterPath';
  }
}
