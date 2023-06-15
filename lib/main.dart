import 'package:bloc_learning/app.dart';
import 'package:bloc_learning/core/services/api_service.dart';
import 'package:bloc_learning/core/services/network_service.dart';
import 'package:bloc_learning/data/repositories/article_repository.dart';
import 'package:bloc_learning/data/repositories/setting_repository.dart';
import 'package:bloc_learning/data/source/local/local_datasource.dart';
import 'package:bloc_learning/data/source/remote/remote_datasource.dart';
import 'package:bloc_learning/presentation/blocs/article/article_bloc.dart';
import 'package:bloc_learning/presentation/blocs/setting/setting_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalDataSource.initialize();

  runApp(
    MultiRepositoryProvider(
      providers: [
        ///
        /// Service
        ///
        RepositoryProvider<NetworkService>(
          create: (context) => NetworkService(),
        ),
        RepositoryProvider<ApiService>(
          create: (context) => ApiService(dio: Dio()),
        ),

        ///
        /// Data sources
        ///
        RepositoryProvider<LocalDataSource>(
          create: (context) => LocalDataSource(),
        ),
        RepositoryProvider<RemoteDataSource>(
          create: (context) => RemoteDataSource(context.read<ApiService>()),
        ),

        ///
        /// Repositories
        ///
        RepositoryProvider<SettingRepository>(
          create: (context) => SettingRepository(
              localDataSource: context.read<LocalDataSource>()),
        ),
        RepositoryProvider<ArticleRepository>(
          create: (context) => ArticleRepository(
            remoteDataSource: context.read<RemoteDataSource>(),
            localDataSource: context.read<LocalDataSource>(),
            networkService: context.read<NetworkService>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          ///
          /// BLoCs
          ///
          BlocProvider<ArticleBloc>(
            create: (context) => ArticleBloc(
                articleRepository: context.read<ArticleRepository>()),
          ),

          ///
          /// Setting Cubit
          ///
          BlocProvider<SettingCubit>(
            create: (context) => SettingCubit(
                settingRepository: context.read<SettingRepository>()),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}
