import 'package:bloc_learning/configs/theme.dart';
import 'package:bloc_learning/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/blocs/setting/setting_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settingCubit = context.watch<SettingCubit>();
    final isDarkMode = settingCubit.state.isDarkMode;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent status bar
        statusBarIconBrightness:
            isDarkMode ? Brightness.light : Brightness.dark,
      ),
    );
    return MaterialApp(
      color: Colors.white,
      title: 'News App',
      theme: isDarkMode ? AppTheme.darkThemeData : AppTheme.lightThemeData,
      debugShowCheckedModeBanner: false,
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppNavigator.onGenerateRoute,
      builder: (context, child) {
        if (child == null) return const SizedBox.shrink();

        return child;
      },
    );
  }
}
