import 'package:delivery_hero_challenge/app/app_defaults.dart';
import 'package:delivery_hero_challenge/app/blueprints/base_page_view.dart';
import 'package:delivery_hero_challenge/models/movie_detail_model.dart';
import 'package:delivery_hero_challenge/models/movie_list_model.dart';
import 'package:delivery_hero_challenge/utils/extensions.dart';
import 'package:delivery_hero_challenge/views/detail_view/detail_viewmodel.dart';
import 'package:delivery_hero_challenge/widgets/box_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailView extends StatelessWidget {
  final MovieItemData movie;
  const DetailView({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailViewModel(movie),
      builder: (context, _) {
        return const Scaffold(
          body: _ViewContent(),
        );
      },
    );
  }
}

class _ViewContent extends StatelessWidget {
  const _ViewContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movie = context.read<DetailViewModel>().movie;
    return Stack(
      children: [
        const Positioned.fill(child: _BackgroundImage()),
        SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: BoxContainer(
                  child: Row(
                    children: [
                      const BackButton(),
                      const SizedBox(
                          width: AppDefaults.kStandartContentPadding),
                      Expanded(
                        child: Text(
                          movie.title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverFillRemaining(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: BasePageView<DetailViewModel>(
                    haveScaffold: false,
                    content: _MovieDetailsWidget(),
                    shouldWaitForGetData: true,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movie = context.read<DetailViewModel>().movie;

    return Visibility(
      visible: movie.backdropPath != null,
      child: Opacity(
        opacity: AppDefaults.kStandartOpacity,
        child: Image.network(
          movie.backgroundImagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _MovieDetailsWidget extends StatelessWidget {
  const _MovieDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.kStandartContentPaddingLow),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const _MoviePosterWidget(),
                const SizedBox(
                  width: AppDefaults.kStandartContentPaddingLow,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(child: _MovieGenresWidget()),
                      Expanded(child: _MovieProductionCompaines())
                    ],
                  ),
                )
              ],
            ),
          ),
          const Expanded(flex: 3, child: _MovieOverviewWidget()),
        ],
      ),
    );
  }
}

class _MoviePosterWidget extends StatelessWidget {
  const _MoviePosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movie = context.read<DetailViewModel>().movie;
    return Visibility(
      visible: movie.posterPath != null,
      child: BoxContainer(
        enablePadding: false,
        showShadow: false,
        width: AppDefaults.kStandartPosterImageWith,
        height: AppDefaults.kStandartPosterImageHeight,
        decorationImage: DecorationImage(
          image: NetworkImage(
            movie.posterImagePath,
          ),
          fit: BoxFit.fitWidth,
        ),
        child: Stack(
          children: [
            Positioned(
              left: AppDefaults.kStandartContentPaddingLow,
              bottom: AppDefaults.kStandartContentPaddingLow,
              child: BoxContainer(
                padding: const EdgeInsets.all(
                    AppDefaults.kStandartContentPaddingLow),
                child: Text(
                  movie.voteAverage.toStringAsFixed(1),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MovieGenresWidget extends StatelessWidget {
  const _MovieGenresWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<DetailViewModel, MovieDetailData>(
      selector: (_, model) => model.data,
      builder: (context, value, _) {
        return Wrap(
          direction: Axis.horizontal,
          runAlignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          alignment: WrapAlignment.start,
          children: value.genres
              .map((genre) => BoxContainer(
                    child: Text(
                      genre.name,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ))
              .toList(),
        );
      },
    );
  }
}

class _MovieProductionCompaines extends StatelessWidget {
  const _MovieProductionCompaines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<DetailViewModel, MovieDetailData>(
      selector: (_, model) => model.data,
      builder: (context, value, _) {
        return Wrap(
          direction: Axis.horizontal,
          runAlignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          alignment: WrapAlignment.start,
          children: value.productionCompanies
              .map(
                (companie) => Visibility(
                  visible: companie.logoPath != null,
                  child: BoxContainer(
                    width: 80,
                    decorationImage: DecorationImage(
                      image: NetworkImage(companie.logoImagePath),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class _MovieOverviewWidget extends StatelessWidget {
  const _MovieOverviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movie = context.read<DetailViewModel>().movie;
    return Visibility(
      visible: movie.overview.isNotEmpty,
      child: BoxContainer(
        showShadow: false,
        child: Text(
          movie.overview,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
