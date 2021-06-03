import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:spacex_launch_manifest/data/data_sources/launch_details_data_source_impl.dart';
import 'package:spacex_launch_manifest/data/models/mission_mode.dart';
import 'package:spacex_launch_manifest/data/models/rocket_model.dart';

import '../../fixtures/fixture_reader.dart';
import 'http_client.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late LaunchDetailsDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = LaunchDetailsDataSourceImpl(mockHttpClient);
  });

  group('Launch details', () {
    final testRocketId = 'test';
    Iterable json = jsonDecode(getRocketsResponse());
    final List<RocketModel> testRockets = List<RocketModel>.from(
        json.map((rocket) => RocketModel.fromJson(rocket)));
    var docs = jsonDecode(getMissionsResponse())['docs'] as List;
    List<MissionModel> testMissions =
        docs.map((mission) => MissionModel.fromJson(mission)).toList();

    test(
        'Should perform GET request and return list of RocketModel on response status 200',
        () async {
      // Arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(getRocketsResponse(), 200));

      // Act
      final result = await dataSource.getRockets();

      // Assert
      expect(result, testRockets);
    });

    test(
        'Should perform POST request and return list of MissionModel on response status 200',
        () async {
      // Arrange
      when(mockHttpClient.post(any,
              headers: anyNamed('headers'), body: anyNamed('body')))
          .thenAnswer((_) async => http.Response(getMissionsResponse(), 200));

      // Act
      final result = await dataSource.getRocketMissions(testRocketId);

      // Assert
      expect(result, testMissions);
    });
  });
}
