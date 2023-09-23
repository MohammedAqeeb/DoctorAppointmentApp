import 'package:json_annotation/json_annotation.dart';

part 'appointment_options.g.dart';

@JsonSerializable(createToJson: false)
class AppointmentOptions {
  final List<String> duration;
  final List<String> package;

  AppointmentOptions({
    required this.duration,
    required this.package,
  });

  factory AppointmentOptions.fromJson(Map<String, dynamic> json) =>
      _$AppointmentOptionsFromJson(json);
}
