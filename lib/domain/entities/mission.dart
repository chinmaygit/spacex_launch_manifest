import 'package:equatable/equatable.dart';

class Mission extends Equatable {
  final String id, missionName;
  final DateTime launchDate;
  final String launchYear;
  final bool success;
  final String patchImage;

  Mission(
      {required this.id,
      required this.missionName,
      required this.launchDate,
      required this.launchYear,
      required this.success,
      required this.patchImage});

  @override
  List<Object?> get props => [id, missionName, launchDate, launchYear, success, patchImage];
}
