import 'package:delivery_hero_challenge/app/blueprints/base_viewmodel.dart';
import 'package:delivery_hero_challenge/models/movie_detail_model.dart';
import 'package:delivery_hero_challenge/models/movie_list_model.dart';

class DetailViewModel extends BaseViewModel {
  final MovieItemData movie;

  DetailViewModel(this.movie);

  late MovieDetailData _data;
  MovieDetailData get data => _data;

  @override
  void disposeModel() {}

  @override
  Future<void> getData() async {
    await _fetchData();
    super.setViewDidLoad(true);
  }

  Future<void> _fetchData() async {
    final model = await super.apiService.getMovieDetail(movie.id);
    if (model.status) {
      _data = model.data;
      return;
    }
  }
}
