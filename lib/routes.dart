import 'package:bloc_learning/core/fade_route.dart';
import 'package:bloc_learning/presentation/screens/detail/detail.dart';
import 'package:bloc_learning/presentation/screens/home/home.dart';
import 'package:bloc_learning/presentation/screens/onboarding/onboarding.dart';
import 'package:bloc_learning/presentation/screens/setting/setting.dart';
import 'package:bloc_learning/presentation/screens/splash/splash.dart';
import 'package:flutter/material.dart';

import 'presentation/screens/favorite/favorite.dart';

enum Routes { onboarding, favorite, splash, home, detail, setting }

class _Paths {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String favorite = '/favorite';
  static const String home = '/home';
  static const String detail = '/detail';
  static const String setting = '/setting';

  static const Map<Routes, String> _pathMap = {
    Routes.splash: _Paths.splash,
    Routes.onboarding: _Paths.onboarding,
    Routes.favorite: _Paths.favorite,
    Routes.home: _Paths.home,
    Routes.detail: _Paths.detail,
    Routes.setting: _Paths.setting,
  };

  static String of(Routes route) => _pathMap[route] ?? splash;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.splash:
        return FadeRoute(page: const SplashScreen());

      case _Paths.onboarding:
        return FadeRoute(page: const OnboardingScreen());

      case _Paths.favorite:
        return FadeRoute(page: const FavoriteScreen());

      case _Paths.home:
        return FadeRoute(page: const HomeScreen());

      case _Paths.detail:
        return FadeRoute(page: const DetailScreen());

      case _Paths.setting:
        return FadeRoute(page: const SettingScreen());

      default:
        return FadeRoute(page: const SplashScreen());
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;
}
