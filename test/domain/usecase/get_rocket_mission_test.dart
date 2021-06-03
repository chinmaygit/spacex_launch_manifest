import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spacex_launch_manifest/domain/entities/mission.dart';
import 'package:spacex_launch_manifest/domain/repository/launch_details_repository.dart';
import 'package:spacex_launch_manifest/domain/usecases/get_rocket_missions.dart';
import 'launch_details_repository.mocks.dart';

@GenerateMocks([LaunchDetailsRepository])
void main() {
  late GetRocketMissions getRocketMissions;
  late MockLaunchDetailsRepository launchDetailsRepository;

  setUp(() {
    launchDetailsRepository = MockLaunchDetailsRepository();
    getRocketMissions = GetRocketMissions(launchDetailsRepository);
  });

  final testRocketId = 'test';

  final testMissions = [
    Mission(
        id: '5eb87cdfffd86e000604b331',
        missionName: 'name 1',
        launchDate: DateTime.now(),
        launchYear: DateTime.now().year.toString(),
        patchImage: 'image 1',
        success: true),
    Mission(
        id: '5eb87ce1ffd86e000604b333',
        missionName: 'name 2',
        launchDate: DateTime.now(),
        launchYear: DateTime.now().year.toString(),
        patchImage: 'image 2',
        success: true),
  ];

  test('Should get list of rocket missions from repository', () async {
    // arrange
    when(launchDetailsRepository.getRocketMissions(testRocketId))
        .thenAnswer((_) async => testMissions);

    // act
    final result = await getRocketMissions(rocketId: testRocketId);

    // assert
    expect(result, testMissions);
    verify(launchDetailsRepository.getRocketMissions(testRocketId));
    verifyNoMoreInteractions(launchDetailsRepository);
  });
}
