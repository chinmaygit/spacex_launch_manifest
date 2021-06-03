import 'package:spacex_launch_manifest/domain/entities/rocket.dart';
import 'package:spacex_launch_manifest/domain/repository/launch_details_repository.dart';

class GetRockets {
  final LaunchDetailsRepository _launchDetailsRepository;

  GetRockets(this._launchDetailsRepository);

  Future<List<Rocket>> call() async {
    return await this._launchDetailsRepository.getRockets();
  }
}
