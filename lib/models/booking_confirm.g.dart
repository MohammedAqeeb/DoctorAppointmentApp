// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_confirm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingConfirm _$BookingConfirmFromJson(Map<String, dynamic> json) =>
    BookingConfirm(
      doctorName: json['doctor_name'] as String? ?? '',
      appointmentDate: DateTime.parse(json['appointment_date'] as String),
      appointmentTime: json['appointment_time'] as String? ?? '',
      location: json['location'] as String? ?? '',
      appointmentPackage: json['appointment_package'] as String? ?? '',
    );
