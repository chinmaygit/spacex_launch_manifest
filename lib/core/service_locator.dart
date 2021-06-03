import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:spacex_launch_manifest/data/data_sources/launch_details_data_source.dart';
import 'package:spacex_launch_manifest/data/data_sources/launch_details_data_source_impl.dart';
import 'package:spacex_launch_manifest/data/repository/launch_details_repository_impl.dart';
import 'package:spacex_launch_manifest/domain/repository/launch_details_repository.dart';
import 'package:spacex_launch_manifest/domain/usecases/get_rocket_missions.dart';
import 'package:spacex_launch_manifest/domain/usecases/get_rockets.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Usecases
  sl.registerLazySingleton(() => GetRockets(sl()));
  sl.registerLazySingleton(() => GetRocketMissions(sl()));

  // Repository
  sl.registerLazySingleton<LaunchDetailsRepository>(
      () => LaunchDetailsRepositoryImpl(sl()));

  // Data source
  sl.registerLazySingleton<LaunchDetailsDataSource>(
      () => LaunchDetailsDataSourceImpl(sl()));

  // ! External dependencies
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
}
