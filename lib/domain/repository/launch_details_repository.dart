import 'package:spacex_launch_manifest/domain/entities/mission.dart';
import 'package:spacex_launch_manifest/domain/entities/rocket.dart';

abstract class LaunchDetailsRepository {
  Future<List<Rocket>> getRockets();
  Future<List<Mission>> getRocketMissions(String rocketId);
  late bool isAppOpened;
}
