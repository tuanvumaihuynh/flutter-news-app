import 'package:bloc_learning/presentation/widgets/shimmer_box.dart';
import 'package:flutter/material.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ShimmerBox(
          height: 130,
          width: 130,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ShimmerBox(
                height: 12,
                width: 120,
              ),
              const SizedBox(height: 12),
              const ShimmerBox(height: 16, width: double.infinity),
              const SizedBox(height: 12),
              const ShimmerBox(height: 16, width: double.infinity),
              const SizedBox(height: 12),
              Row(
                children: const [
                  ShimmerBox(
                    height: 12,
                    width: 80,
                  ),
                  SizedBox(width: 16),
                  ShimmerBox(
                    height: 12,
                    width: 60,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
