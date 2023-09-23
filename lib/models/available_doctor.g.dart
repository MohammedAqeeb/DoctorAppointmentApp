// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableDoctors _$AvailableDoctorsFromJson(Map<String, dynamic> json) =>
    AvailableDoctors(
      doctorName: json['doctor_name'] as String? ?? '',
      image: json['image'] as String? ?? '',
      speciality: json['speciality'] as String? ?? '',
      location: json['location'] as String? ?? '',
      patientsServed: json['patients_served'] as int? ?? 0,
      yearsOfExperience: json['years_of_experience'] as int? ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      numberOfReviews: json['number_of_reviews'] as int? ?? 0,
      availability: (json['availability'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );
