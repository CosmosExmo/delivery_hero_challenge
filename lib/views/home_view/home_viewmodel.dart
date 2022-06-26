import 'package:delivery_hero_challenge/app/blueprints/base_viewmodel.dart';
import 'package:delivery_hero_challenge/models/movie_list_model.dart';
import 'package:delivery_hero_challenge/views/detail_view/detail_view.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends BaseViewModel {
  final ScrollController _scrollController = ScrollController();
  ScrollController get controller => _scrollController;

  @override
  void disposeModel() {
    _scrollController.dispose();
  }

  @override
  Future<void> getData() async {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
    await _fetchData();
    super.setViewDidLoad(true);
  }

  List<MovieItemData> _items = [];
  List<MovieItemData> get items => _items.toList();

  int _page = 1;
  bool _lastPage = false;

  String _query = "";

  void setQuery(String value) {
    _query = value;
    _page = 1;
    _lastPage = false;
    _items.clear();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final searchMovies = _query.isNotEmpty;

    if (_lastPage) {
      return;
    }

    final params = {
      'page': _page,
      if (searchMovies) 'query': _query,
    };

    final model = await super.apiService.getPopularMovies(params,
        endPoint: searchMovies ? "search/movie" : "movie/popular");
    if (model.status) {
      if (_items.isEmpty) {
        _items = model.data;
      } else {
        _lastPage = model.totalPages == _page;
        _items.addAll(model.data);
      }
      notifyListeners();
      _page++;
      return;
    }
  }

  void onMovieClicked(BuildContext context, MovieItemData movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailView(movie: movie),
      ),
    );
  }
}
