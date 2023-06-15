import 'dart:async';

import 'package:bloc_learning/configs/sizes.dart';
import 'package:bloc_learning/presentation/blocs/article/article_bloc.dart';
import 'package:bloc_learning/presentation/blocs/article/article_event.dart';
import 'package:bloc_learning/presentation/blocs/setting/setting_cubit.dart';
import 'package:bloc_learning/presentation/blocs/setting/setting_state.dart';
import 'package:bloc_learning/presentation/widgets/article_card.dart';
import 'package:bloc_learning/presentation/widgets/h_choice_chips.dart';
import 'package:bloc_learning/presentation/widgets/search_bar.dart';
import 'package:bloc_learning/presentation/widgets/shimmer_card.dart';
import 'package:bloc_learning/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/article.dart';
import '../../blocs/article/article_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const double _appBarHeight = 170.0;

  static const double _endReachedThreshold = 200;

  final GlobalKey<NestedScrollViewState> _scrollKey = GlobalKey();

  SettingCubit get _settingCubit => context.read<SettingCubit>();
  ArticleBloc get _articleBloc => context.read<ArticleBloc>();

  @override
  void initState() {
    scheduleMicrotask(() {
      _articleBloc.add(ArticleLoad());
      _scrollKey.currentState?.innerController.addListener(_onScroll);
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollKey.currentState?.innerController.dispose();
    _scrollKey.currentState?.dispose();

    super.dispose();
  }

  /// This method is called when the user scrolls.
  ///
  /// It checks if the user has reached the end of the list.
  ///
  /// If so, it loads more articles.
  void _onScroll() {
    final innerController = _scrollKey.currentState?.innerController;

    if (innerController == null || !innerController.hasClients) return;

    final thresholdReached =
        innerController.position.extentAfter < _endReachedThreshold;

    if (thresholdReached &&
        _articleBloc.state.status != ArticleStateStatus.loadingMore) {
      // Load more!

      _articleBloc.add(ArticleLoadMore());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        key: _scrollKey,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            _buildAppBar(),
          ];
        },
        body: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            switch (state.status) {
              case ArticleStateStatus.initial:
              case ArticleStateStatus.loading:
                return _buildShimmer();

              case ArticleStateStatus.loadSuccess:
              case ArticleStateStatus.loadMoreSuccess:
              case ArticleStateStatus.loadingMore:
                return _buildBody(state.articles);

              case ArticleStateStatus.loadFailure:
              case ArticleStateStatus.loadMoreFailure:
                return _buildError(state.error!);
            }
          },
        ),
      ),
    );
  }

  void _onArticleTap(Article article) {
    _articleBloc.add(ArticleSelectedChanged(article: article));

    AppNavigator.push(Routes.detail);
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: _appBarHeight,
      centerTitle: true,
      pinned: true,
      floating: true,
      title: const Text(
        'News app',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        BlocBuilder<SettingCubit, SettingState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                _settingCubit.toggleTheme();
              },
              icon: Icon(
                state.isDarkMode
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined,
              ),
            );
          },
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
              child: SearchBar(),
            ),
            const SizedBox(height: 8.0),
            HChoiceChips(
              onSelected: (category) {
                _articleBloc.add(ArticleLoad(query: category));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmer() {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          7,
          (index) => const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppSizes.padding, vertical: 10.0),
            child: ShimmerCard(),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(List<Article> articles) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: articles.length,
            (context, index) => Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.padding, vertical: 10),
              child: ArticleCard(
                onTap: () => _onArticleTap(articles[index]), //
                article: articles[index],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
            child: _articleBloc.state.canLoadMore
                ? const Center(
                    child: Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: CircularProgressIndicator(),
                  ))
                : const SizedBox.shrink()),
      ],
    );
  }

  Widget _buildError(Exception e) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(e.toString()),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            _articleBloc.add(ArticleLoad());
          },
          child: const Text('Retry'),
        ),
      ],
    );
  }
}
