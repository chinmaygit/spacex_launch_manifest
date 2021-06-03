import 'dart:convert';

import 'package:spacex_launch_manifest/core/error/exceptions.dart';
import 'package:spacex_launch_manifest/data/data_sources/launch_details_data_source.dart';
import 'package:spacex_launch_manifest/data/models/rocket_model.dart';
import 'package:spacex_launch_manifest/data/models/mission_mode.dart';

import 'package:http/http.dart' as http;

class LaunchDetailsDataSourceImpl implements LaunchDetailsDataSource {
  final http.Client client;

  LaunchDetailsDataSourceImpl(this.client);

  @override
  Future<List<MissionModel>> getRocketMissions(String rocketId) async {
    var url = Uri.parse('https://api.spacexdata.com/v4/launches/query');
    var body = jsonEncode({
      'query': {'rocket': rocketId},
      'options': {'pagination': false}
    });

    print('BODY: ' + body);
    try {
      var response = await client
          .post(url, body: body, headers: {'Content-Type': 'application/json'});
      var json = jsonDecode(response.body);
      var docs = json['docs'] as List;
      List<MissionModel> missions =
          docs.map((mission) => MissionModel.fromJson(mission)).toList();
      return missions;
    } catch (e) {
      print(e.toString());
      throw ServerException();
    }
  }

  @override
  Future<List<RocketModel>> getRockets() async {
    var url = Uri.parse('https://api.spacexdata.com/v4/rockets');
    try {
      var response =
          await client.get(url, headers: {'Content-Type': 'application/json'});
      Iterable json = jsonDecode(response.body);
      List<RocketModel> rockets = List<RocketModel>.from(
          json.map((rocket) => RocketModel.fromJson(rocket)));
      return rockets;
    } catch (e) {
      throw ServerException();
    }
  }
}
