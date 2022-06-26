import 'package:delivery_hero_challenge/app/blueprints/base_viewmodel.dart';
import 'package:delivery_hero_challenge/models/movie_model.dart';

class DetailViewModel extends BaseViewModel {
  final MovieModel movie;

  DetailViewModel(this.movie);

  @override
  void disposeModel() {}

  @override
  Future<void> getData() async {}
}
