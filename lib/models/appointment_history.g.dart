// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentHistory _$AppointmentHistoryFromJson(Map<String, dynamic> json) =>
    AppointmentHistory(
      bookingId: json['booking_id'] as String? ?? '',
      doctorName: json['doctor_name'] as String? ?? '',
      location: json['location'] as String? ?? '',
      appointmentDate: DateTime.parse(json['appointment_date'] as String),
      appointmentTime: json['appointment_time'] as String? ?? '',
    );
