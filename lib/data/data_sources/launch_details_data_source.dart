import 'package:spacex_launch_manifest/data/models/mission_mode.dart';
import 'package:spacex_launch_manifest/data/models/rocket_model.dart';

abstract class LaunchDetailsDataSource {
  Future<List<RocketModel>> getRockets();
  Future<List<MissionModel>> getRocketMissions(String rocketId);
}
