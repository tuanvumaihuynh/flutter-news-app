import 'dart:async';

import 'package:bloc_learning/configs/colors.dart';
import 'package:bloc_learning/configs/images.dart';
import 'package:bloc_learning/configs/sizes.dart';

import 'package:bloc_learning/presentation/widgets/rounded_button.dart';
import 'package:bloc_learning/routes.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    scheduleMicrotask(() async {
      await AppImages.precacheOnboardingAssets(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double splashIconSize = 350;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AppImages.onboarding,
                height: splashIconSize,
                width: splashIconSize,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 30),
              Text(
                'Welcome to News App!',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 20),
              Text(
                'Get the latest news from around the world',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 50),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppSizes.padding),
                child: RoundedButton(
                  onTap: () async {
                    await AppNavigator.replaceWith(Routes.favorite);
                  },
                  child: const Text('Get Started',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
