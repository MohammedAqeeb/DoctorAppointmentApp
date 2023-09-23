import 'package:json_annotation/json_annotation.dart';

part 'appointment_history.g.dart';

@JsonSerializable(createToJson: false)
class AppointmentHistory {
  @JsonKey(defaultValue: '', name: 'booking_id')
  final String bookingId;

  @JsonKey(defaultValue: '', name: 'doctor_name')
  final String doctorName;

  @JsonKey(defaultValue: '')
  final String location;

  @JsonKey(name: 'appointment_date')
  final DateTime appointmentDate;

  @JsonKey(defaultValue: '', name: 'appointment_time')
  final String appointmentTime;

  AppointmentHistory({
    required this.bookingId,
    required this.doctorName,
    required this.location,
    required this.appointmentDate,
    required this.appointmentTime,
  });

  factory AppointmentHistory.fromJson(Map<String, dynamic> json) =>
      _$AppointmentHistoryFromJson(json);
}
