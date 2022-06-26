import 'package:delivery_hero_challenge/app/app_defaults.dart';
import 'package:delivery_hero_challenge/app/blueprints/base_page_view.dart';
import 'package:delivery_hero_challenge/models/movie_model.dart';
import 'package:delivery_hero_challenge/utils/extensions.dart';
import 'package:delivery_hero_challenge/views/home_view/home_viewmodel.dart';
import 'package:delivery_hero_challenge/widgets/box_container.dart';
import 'package:delivery_hero_challenge/widgets/searchable_field_widget/searchable_field_view.dart';
import 'package:delivery_hero_challenge/widgets/searchable_field_widget/searchable_field_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      builder: (context, _) {
        return const BasePageView<HomeViewModel>(
          content: _ViewContent(),
        );
      },
    );
  }
}

class _ViewContent extends StatelessWidget {
  const _ViewContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SearchableFieldView(
              params: SearchableFieldViewParams(
                expanded: false,
                title: "Ara...",
                onChanged: context.read<HomeViewModel>().setQuery,
                maxLines: 1,
              ),
            ),
          ),
          const SliverFillRemaining(
            child: _MoviesGridViewWidget(),
          )
        ],
      ),
    );
  }
}

class _MoviesGridViewWidget extends StatelessWidget {
  const _MoviesGridViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<HomeViewModel, List<MovieModel>>(
      selector: (_, model) => model.items,
      builder: (context, value, _) {
        if (value.isEmpty) {
          return const Center(
            child: Text("Aradığınız isimde film bulunamadı."),
          );
        }
        return GridView.builder(
          controller: context.read<HomeViewModel>().controller,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: AppDefaults.kStandartCrossAxisCount,
          ),
          itemCount: value.length + AppDefaults.kStandartCrossAxisCount,
          itemBuilder: (context, index) {
            if (index >= value.length) {
              return const SizedBox(
                  height: AppDefaults.kStandartContentPadding);
            }

            final item = value[index];
            return _MovieItemWidget(
              item: item,
            );
          },
        );
      },
    );
  }
}

class _MovieItemWidget extends StatelessWidget {
  final MovieModel item;
  const _MovieItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BoxContainer(
      enablePadding: false,
      child: InkWell(
        onTap: () =>
            context.read<HomeViewModel>().onMovieClicked(context, item),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: item.posterPath != null
                        ? Image.network(
                            item.posterImagePath,
                            fit: BoxFit.cover,
                          )
                        : const SizedBox.shrink(),
                  ),
                  Positioned(
                    left: AppDefaults.kStandartContentPaddingLow,
                    bottom: AppDefaults.kStandartContentPaddingLow,
                    child: BoxContainer(
                      padding: const EdgeInsets.all(
                          AppDefaults.kStandartContentPaddingLow),
                      child: Text(
                        item.voteAverage.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft:
                      Radius.circular(AppDefaults.kStandartBorderRadius),
                  bottomRight:
                      Radius.circular(AppDefaults.kStandartBorderRadius),
                ),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 0.5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: AppDefaults.kStandartContentPaddingLow),
                child: Text(
                  item.title,
                  style: Theme.of(context).textTheme.subtitle1,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
