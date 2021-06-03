import 'package:flutter/material.dart';
import 'package:spacex_launch_manifest/domain/entities/mission.dart';

class MissionTile extends StatelessWidget {
  final Mission mission;
  const MissionTile({Key? key, required this.mission}) : super(key: key);

  getLaunchDate(DateTime date) {
    return '${date.day}-${date.month}-${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          child: FadeInImage.assetNetwork(
            image: mission.patchImage,
            placeholder: 'assets/loading.gif',
            placeholderScale: 0.5,
          ),
          height: 56),
      title: Text(mission.missionName),
      subtitle: Text(this.getLaunchDate(mission.launchDate)),
      trailing: Text(mission.success
          ? 'SUCCESS'
          : mission.launchDate.isAfter(DateTime.now())
              ? 'WAITING'
              : 'FAILURE'),
    );
  }
}
