import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:spacex_launch_manifest/data/models/mission_mode.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final tMissionModel = MissionModel(
      id: '5eb87cddffd86e000604b32f',
      missionName: 'Falcon 9 Test Flight',
      launchDate: DateTime.fromMillisecondsSinceEpoch(1275677100),
      launchYear:
          DateTime.fromMillisecondsSinceEpoch(1275677100).year.toString(),
      patchImage: 'https://images2.imgbox.com/5c/36/gbDKf6Y7_o.png',
      success: true);
  test('Should return valid mission model When json is decoded ', () {
    // Arrange
    Map<String, dynamic> missionJson = jsonDecode(getMission());

    // Act
    final result = MissionModel.fromJson(missionJson);

    // Assert
    expect(result, tMissionModel);
  });
}
