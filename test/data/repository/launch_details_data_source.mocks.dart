// Mocks generated by Mockito 5.0.9 from annotations
// in spacex_launch_manifest/test/data/repository/launch_details_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:spacex_launch_manifest/data/data_sources/launch_details_data_source.dart'
    as _i2;
import 'package:spacex_launch_manifest/data/models/mission_mode.dart' as _i5;
import 'package:spacex_launch_manifest/data/models/rocket_model.dart' as _i4;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [LaunchDetailsDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockLaunchDetailsDataSource extends _i1.Mock
    implements _i2.LaunchDetailsDataSource {
  MockLaunchDetailsDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.RocketModel>> getRockets() => (super.noSuchMethod(
          Invocation.method(#getRockets, []),
          returnValue: Future<List<_i4.RocketModel>>.value(<_i4.RocketModel>[]))
      as _i3.Future<List<_i4.RocketModel>>);
  @override
  _i3.Future<List<_i5.MissionModel>> getRocketMissions(String? rocketId) =>
      (super.noSuchMethod(Invocation.method(#getRocketMissions, [rocketId]),
              returnValue:
                  Future<List<_i5.MissionModel>>.value(<_i5.MissionModel>[]))
          as _i3.Future<List<_i5.MissionModel>>);
}
