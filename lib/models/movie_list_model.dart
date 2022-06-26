import 'package:delivery_hero_challenge/app/blueprints/api_response.dart';
import 'package:delivery_hero_challenge/models/movie_model.dart';

class MovieListModel extends ApiResponse {
  late List<MovieModel> data;

  MovieListModel.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    final List<MovieModel> data = map['results'] != null
        ? List<MovieModel>.from(map['results']
            ?.map((x) => MovieModel.fromMap(x as Map<String, dynamic>)))
        : [];
    this.data = data;
  }

  MovieListModel.withError(String error) : super.withError(error);

  @override
  Map<String, dynamic> toMap() {
    return {};
  }
}
