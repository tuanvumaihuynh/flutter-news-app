import 'package:bloc_learning/presentation/widgets/shimmer_box.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageCustom extends StatelessWidget {
  const CachedImageCustom(
      {super.key,
      required this.imageUrl,
      required this.height,
      required this.width});

  final String imageUrl;

  final double height;

  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: CachedNetworkImage(
          imageUrl: imageUrl,
          height: height,
          width: width,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
              ShimmerBox(height: height, width: width),
          errorWidget: (context, url, error) => const Placeholder()),
    );
  }
}
