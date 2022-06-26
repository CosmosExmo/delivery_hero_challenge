import 'package:delivery_hero_challenge/models/movie_list_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/json_mocks.dart';

void main() async {
  group("MovieListModel Model Tests", () {
    test(
      "initilize MovieListModel from json",
      () async {
        final json = JsonMocks.movieListJsonMock;

        final model = MovieListModel.fromMap(json);

        expect(model, isA<MovieListModel>());
      },
    );
  });
}
