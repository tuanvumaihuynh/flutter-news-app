import 'package:bloc_learning/configs/sizes.dart';
import 'package:bloc_learning/presentation/blocs/article/article_bloc.dart';
import 'package:bloc_learning/presentation/widgets/cached_image_custom.dart';
import 'package:bloc_learning/utils/date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final articleBloc = context.read<ArticleBloc>();

    final article = articleBloc.state.selectedArticle;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          article!.source.name,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_border,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(article.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Text(
                '${article.author} · ${article.publishedAt.yMMMdFormat()}',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.grey),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              CachedImageCustom(
                  imageUrl: article.imageUrl,
                  height: 300,
                  width: double.infinity),
              const SizedBox(height: 16),
              Text(article.description,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 18)),
              const SizedBox(height: 16),
              Text(article.content,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
