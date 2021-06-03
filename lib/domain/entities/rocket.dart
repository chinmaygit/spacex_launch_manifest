import 'package:equatable/equatable.dart';

class Rocket extends Equatable {
  final String id, name, country, description;
  final int engineCount;
  final String image;
  final bool isActive;

  Rocket(
      {required this.id,
      required this.name,
      required this.country,
      required this.description,
      required this.engineCount,
      required this.image,
      this.isActive = false});

  @override
  List<Object?> get props =>
      [id, name, country, description, engineCount, image, isActive];
}
