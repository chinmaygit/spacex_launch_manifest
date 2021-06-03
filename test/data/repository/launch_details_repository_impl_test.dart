import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spacex_launch_manifest/data/data_sources/launch_details_data_source.dart';
import 'package:spacex_launch_manifest/data/models/mission_mode.dart';
import 'package:spacex_launch_manifest/data/models/rocket_model.dart';
import 'package:spacex_launch_manifest/data/repository/launch_details_repository_impl.dart';

import 'launch_details_data_source.mocks.dart';

@GenerateMocks([LaunchDetailsDataSource])
void main() {
  late LaunchDetailsRepositoryImpl repository;
  late MockLaunchDetailsDataSource dataSource;

  setUp(() {
    dataSource = MockLaunchDetailsDataSource();
    repository = LaunchDetailsRepositoryImpl(dataSource);
  });

  group('Get rockets', () {
    final testRockets = [
      RocketModel(
          id: 'test 1',
          name: 'name 1',
          country: 'country 1',
          description: 'description 1',
          engineCount: 1,
          isActive: true,
          image: 'images 1'),
      RocketModel(
          id: 'test 2',
          name: 'name 2',
          country: 'country 2',
          description: 'description 2',
          engineCount: 2,
          isActive: true,
          image: 'images 2')
    ];

    test(
        'Should return list of rockets When call to Launch Data Source is successful',
        () async {
      // Arrange
      when(dataSource.getRockets())
          .thenAnswer((realInvocation) async => testRockets);

      // Act
      final result = await repository.getRockets();

      // Assert
      expect(result, testRockets);
    });
  });

  group('Get Missions', () {
    final testRocketId = 'test';

    final testMissions = [
      MissionModel(
          id: '5eb87cdfffd86e000604b331',
          missionName: 'name 1',
          launchDate: DateTime.now(),
          launchYear: DateTime.now().year.toString(),
          patchImage: 'image 1',
          success: true),
      MissionModel(
          id: '5eb87ce1ffd86e000604b333',
          missionName: 'name 2',
          launchDate: DateTime.now(),
          launchYear: DateTime.now().year.toString(),
          patchImage: 'image 2',
          success: true),
    ];

    test(
        'Should return missions, Given rocket Id When call to call to Launch Data Source is successful',
        () async {
      // Arrange
      when(dataSource.getRocketMissions(testRocketId))
          .thenAnswer((realInvocation) async => testMissions);

      // Act
      final result = await repository.getRocketMissions(testRocketId);

      // Assert
      expect(result, testMissions);
    });
  });
}
