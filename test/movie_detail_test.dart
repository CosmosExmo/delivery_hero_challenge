import 'package:delivery_hero_challenge/models/movie_detail_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/json_mocks.dart';

void main() async {
  group("MovieDetailModel Model Tests", () {
    test(
      "initilize MovieDetailModel from json",
      () async {
        final json = JsonMocks.movieDetailJsonMock;

        final model = MovieDetailModel.fromMap(json);

        expect(model, isA<MovieDetailModel>());
      },
    );
  });
}
