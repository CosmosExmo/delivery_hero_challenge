import 'package:delivery_hero_challenge/models/movie_detail_model.dart';
import 'package:delivery_hero_challenge/models/movie_list_model.dart';

extension MovieItemDataExtension on MovieItemData {
  String get posterImagePath {
    return 'https://image.tmdb.org/t/p/w200$posterPath';
  }

  String get backgroundImagePath {
    return 'https://image.tmdb.org/t/p/original$backdropPath';
  }
}

extension MovieProductionCompaieExtension on MovieProductionCompanie {
  String get logoImagePath {
    return 'https://image.tmdb.org/t/p/w200$logoPath';
  }
}
