import 'package:spacex_launch_manifest/domain/entities/mission.dart';
import 'package:spacex_launch_manifest/domain/repository/launch_details_repository.dart';

class GetRocketMissions {
  final LaunchDetailsRepository _launchDetailsRepository;

  GetRocketMissions(this._launchDetailsRepository);

  Future<List<Mission>> call({required String rocketId}) async {
    return await this._launchDetailsRepository.getRocketMissions(rocketId);
  }
}
