import 'package:bloc_learning/configs/colors.dart';
import 'package:flutter/material.dart';

class ShimmerBox extends StatelessWidget {
  const ShimmerBox({Key? key, this.height, this.width}) : super(key: key);

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
          color: AppColors.shimmerColor,
          borderRadius: BorderRadius.all(Radius.circular(14))),
    );
  }
}
