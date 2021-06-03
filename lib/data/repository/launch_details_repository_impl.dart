import 'package:shared_preferences/shared_preferences.dart';
import 'package:spacex_launch_manifest/core/service_locator.dart';
import 'package:spacex_launch_manifest/data/data_sources/launch_details_data_source.dart';
import 'package:spacex_launch_manifest/domain/entities/rocket.dart';
import 'package:spacex_launch_manifest/domain/entities/mission.dart';
import 'package:spacex_launch_manifest/domain/repository/launch_details_repository.dart';

class LaunchDetailsRepositoryImpl implements LaunchDetailsRepository {
  final LaunchDetailsDataSource _dataSource;
  final SharedPreferences _sharedPreferences;

  LaunchDetailsRepositoryImpl(this._dataSource)
      : _sharedPreferences = sl<SharedPreferences>();

  @override
  Future<List<Mission>> getRocketMissions(String rocketId) {
    return _dataSource.getRocketMissions(rocketId);
  }

  @override
  Future<List<Rocket>> getRockets() {
    return _dataSource.getRockets();
  }

  bool get isAppOpened => _sharedPreferences.getBool('IS_APP_OPENED') ?? false;

  set isAppOpened(bool isAppOpened) {
    _sharedPreferences.setBool('IS_APP_OPENED', isAppOpened);
  }
}
