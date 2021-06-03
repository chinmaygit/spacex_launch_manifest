import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spacex_launch_manifest/domain/entities/rocket.dart';
import 'package:spacex_launch_manifest/domain/repository/launch_details_repository.dart';
import 'package:spacex_launch_manifest/domain/usecases/get_rockets.dart';
import 'launch_details_repository.mocks.dart';

@GenerateMocks([LaunchDetailsRepository])
void main() {
  late GetRockets getRockets;
  late MockLaunchDetailsRepository launchDetailsRepository;

  setUp(() {
    launchDetailsRepository = MockLaunchDetailsRepository();
    getRockets = GetRockets(launchDetailsRepository);
  });

  final testRockets = [
    Rocket(
        id: 'test 1',
        name: 'name 1',
        country: 'country 1',
        description: 'description 1',
        engineCount: 1,
        isActive: true,
        image: 'images 1'),
    Rocket(
        id: 'test 2',
        name: 'name 2',
        country: 'country 2',
        description: 'description 2',
        engineCount: 2,
        isActive: false,
        image: 'images 2')
  ];

  test('Should get list of rockets from repository', () async {
    // arrange
    when(launchDetailsRepository.getRockets())
        .thenAnswer((_) async => testRockets);

    // act
    final result = await getRockets();

    // assert
    expect(result, testRockets);
    verify(launchDetailsRepository.getRockets());
    verifyNoMoreInteractions(launchDetailsRepository);
  });
}
