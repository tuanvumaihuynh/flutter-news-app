import 'package:flutter/material.dart';

const String _imagePath = 'assets/images';

class _Image extends AssetImage {
  const _Image(String fileName) : super('$_imagePath/$fileName');
}

class AppImages {
  static const logo = _Image('nbc_logo.png');

  static const onboarding = _Image('onboarding.png');
  static const bussiness = _Image('bussiness.png');
  static const education = _Image('education.jpg');
  static const entertainment = _Image('entertainment.jpeg');
  static const car = _Image('car.jpg');
  static const environment = _Image('environment.jpg');
  static const health = _Image('health.jpeg');
  static const science = _Image('science.jpg');
  static const sports = _Image('sports.jpg');
  static const technology = _Image('technology.png');
  static const politic = _Image('politic.jpg');

  static Future precacheSplashAssets(BuildContext context) async {
    await Future.wait([
      precacheImage(logo, context),
    ]);
  }

  static Future precacheOnboardingAssets(BuildContext context) async {
    await Future.wait([
      precacheImage(onboarding, context),
      precacheImage(bussiness, context),
      precacheImage(education, context),
      precacheImage(entertainment, context),
      precacheImage(car, context),
      precacheImage(environment, context),
      precacheImage(health, context),
      precacheImage(science, context),
      precacheImage(sports, context),
      precacheImage(technology, context),
      precacheImage(politic, context),
    ]);
  }
}
