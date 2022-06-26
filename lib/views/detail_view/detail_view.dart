import 'package:delivery_hero_challenge/app/blueprints/base_page_view.dart';
import 'package:delivery_hero_challenge/models/movie_model.dart';
import 'package:delivery_hero_challenge/views/detail_view/detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailView extends StatelessWidget {
  final MovieModel movie;
  const DetailView({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailViewModel(movie),
      builder: (context, _) {
        return BasePageView<DetailViewModel>(
          appBar: AppBar(title: Text(movie.title)),
          content: const _ViewContent(),
        );
      },
    );
  }
}

class _ViewContent extends StatelessWidget {
  const _ViewContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
