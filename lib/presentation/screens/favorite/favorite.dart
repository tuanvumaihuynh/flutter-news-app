import 'package:bloc_learning/configs/images.dart';
import 'package:bloc_learning/configs/sizes.dart';
import 'package:bloc_learning/presentation/widgets/category_card.dart';
import 'package:bloc_learning/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../blocs/setting/setting_cubit.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  Map<String, AssetImage> imagesMap = {
    'Bussiness': AppImages.bussiness,
    'Education': AppImages.education,
    'Entertainment': AppImages.entertainment,
    'Sports': AppImages.sports,
    'Environment': AppImages.environment,
    'Health': AppImages.health,
    'Car': AppImages.car,
    'Science': AppImages.science,
    'Politic': AppImages.politic,
    'Technology': AppImages.technology,
  };

  List<String> selectedCategory = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: MasonryGridView.builder(
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemCount: imagesMap.length,
        itemBuilder: (context, index) {
          final title = imagesMap.keys.elementAt(index);

          final image = imagesMap.values.elementAt(index);

          return Padding(
            padding: const EdgeInsets.all(8),
            child: CategoryCard(
              onTap: () {
                setState(() {
                  if (selectedCategory.contains(title)) {
                    selectedCategory.remove(title);
                  } else {
                    selectedCategory.add(title);
                  }
                });
              },
              isSelected: selectedCategory.contains(title),
              title: title,
              image: image,
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) => AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await context.read<SettingCubit>().updateFavoriteSubject(
                  selectedCategory.map((e) => e.toLowerCase()).toList());
              await AppNavigator.replaceWith(Routes.home);
            },
            icon: const Icon(
              Icons.done,
              color: Colors.black,
            ),
          ),
        ],
        title: Text(
          'News category',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
      );
}
