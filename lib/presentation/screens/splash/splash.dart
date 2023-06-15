import 'dart:async';

import 'package:bloc_learning/configs/images.dart';
import 'package:bloc_learning/presentation/blocs/setting/setting_cubit.dart';
import 'package:bloc_learning/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final double _splashIconSize = 200;

  SettingCubit get _settingCubit => context.read<SettingCubit>();

  @override
  void initState() {
    scheduleMicrotask(() async {
      await AppImages.precacheSplashAssets(context);

      bool firstOpenApp = _settingCubit.state.firstOpenApp;

      await Future.delayed(const Duration(seconds: 1));

      if (firstOpenApp) {
        await AppNavigator.replaceWith(Routes.onboarding);
      } else {
        await AppNavigator.replaceWith(Routes.home);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AppImages.logo,
              height: _splashIconSize,
              width: _splashIconSize,
              fit: BoxFit.contain,
            ),
            Text(
              'News App',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
