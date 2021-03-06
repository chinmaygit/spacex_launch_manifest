// Mocks generated by Mockito 5.0.9 from annotations
// in spacex_launch_manifest/test/domain/usecase/get_rocket_mission_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:spacex_launch_manifest/domain/entities/mission.dart' as _i5;
import 'package:spacex_launch_manifest/domain/entities/rocket.dart' as _i4;
import 'package:spacex_launch_manifest/domain/repository/launch_details_repository.dart'
    as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [LaunchDetailsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockLaunchDetailsRepository extends _i1.Mock
    implements _i2.LaunchDetailsRepository {
  MockLaunchDetailsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Rocket>> getRockets() =>
      (super.noSuchMethod(Invocation.method(#getRockets, []),
              returnValue: Future<List<_i4.Rocket>>.value(<_i4.Rocket>[]))
          as _i3.Future<List<_i4.Rocket>>);
  @override
  _i3.Future<List<_i5.Mission>> getRocketMissions(String? rocketId) =>
      (super.noSuchMethod(Invocation.method(#getRocketMissions, [rocketId]),
              returnValue: Future<List<_i5.Mission>>.value(<_i5.Mission>[]))
          as _i3.Future<List<_i5.Mission>>);
}
