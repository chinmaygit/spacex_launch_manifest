import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:spacex_launch_manifest/data/models/rocket_model.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final tRocketModel = RocketModel(
      id: '5e9d0d95eda69974db09d1ed',
      name: 'Falcon Heavy',
      isActive: true,
      country: "United States",
      description:
          "With the ability to lift into orbit over 54 metric tons (119,000 lb)--a mass equivalent to a 737 jetliner loaded with passengers, crew, luggage and fuel--Falcon Heavy can lift more than twice the payload of the next closest operational vehicle, the Delta IV Heavy, at one-third the cost.",
      engineCount: 27,
      image:
          "https://farm5.staticflickr.com/4599/38583829295_581f34dd84_b.jpg");
  test('Should return valid rocket model When json is decoded ', () {
    // Arrange
    Map<String, dynamic> rocketJson = jsonDecode(getRocket());

    // Act
    final result = RocketModel.fromJson(rocketJson);

    // Assert
    expect(result, tRocketModel);
  });
}
