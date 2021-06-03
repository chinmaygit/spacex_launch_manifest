import 'dart:io';

String getRocket() => File('test/fixtures/rocket.json').readAsStringSync();

String getRocketsResponse() =>
    File('test/fixtures/rockets_response.json').readAsStringSync();

String getMission() => File('test/fixtures/mission.json').readAsStringSync();

String getMissionsResponse() =>
    File('test/fixtures/missions_response.json').readAsStringSync();
