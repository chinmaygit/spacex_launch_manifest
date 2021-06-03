import 'package:spacex_launch_manifest/domain/entities/mission.dart';

class MissionModel extends Mission {
  MissionModel(
      {required String id,
      required String missionName,
      required DateTime launchDate,
      required String launchYear,
      required bool success,
      required String patchImage})
      : super(
            id: id,
            missionName: missionName,
            launchDate: launchDate,
            launchYear: launchYear,
            patchImage: patchImage,
            success: success);

  factory MissionModel.fromJson(Map<String, dynamic> json) {
    return MissionModel(
        id: json['id'],
        missionName: json['name'],
        launchDate: DateTime.parse(json['date_local']),
        launchYear: DateTime.parse(json['date_local']).year.toString(),
        patchImage: json['links']?['patch']?['small'] ??
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/240px-No_image_available.svg.png',
        success: json['success'] ?? false);
  }
}
