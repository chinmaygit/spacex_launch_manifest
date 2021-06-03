import 'package:spacex_launch_manifest/domain/entities/rocket.dart';

class RocketModel extends Rocket {
  RocketModel(
      {required String id,
      required String name,
      required bool isActive,
      required String country,
      required String description,
      required int engineCount,
      required String image})
      : super(
            id: id,
            country: country,
            description: description,
            engineCount: engineCount,
            image: image,
            name: name,
            isActive: isActive);

  factory RocketModel.fromJson(Map<String, dynamic> json) {
    final List<String> images = List.from(json['flickr_images']);
    return RocketModel(
        id: json['id'],
        name: json['name'],
        isActive: json['active'],
        country: json['country'],
        description: json['description'],
        engineCount: json['engines']['number'],
        image: images[0]);
  }
}
