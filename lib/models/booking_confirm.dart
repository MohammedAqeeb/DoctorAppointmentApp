import 'package:json_annotation/json_annotation.dart';

part 'booking_confirm.g.dart';

@JsonSerializable(createToJson: false)
class BookingConfirm {
  @JsonKey(defaultValue: '', name: 'doctor_name')
  final String doctorName;

  @JsonKey(name: 'appointment_date')
  final DateTime appointmentDate;

  @JsonKey(defaultValue: '', name: 'appointment_time')
  final String appointmentTime;

  @JsonKey(defaultValue: '')
  final String location;
  @JsonKey(defaultValue: '', name: 'appointment_package')
  final String appointmentPackage;

  BookingConfirm({
    required this.doctorName,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.location,
    required this.appointmentPackage,
  });

  factory BookingConfirm.fromJson(Map<String, dynamic> json) =>
      _$BookingConfirmFromJson(json);
}
