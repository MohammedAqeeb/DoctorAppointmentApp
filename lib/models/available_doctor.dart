import 'package:json_annotation/json_annotation.dart';

part 'available_doctor.g.dart';

@JsonSerializable(createToJson: false)
class AvailableDoctors {
  @JsonKey(defaultValue: '', name: 'doctor_name')
  final String doctorName;
  @JsonKey(defaultValue: '')
  final String image, speciality, location;
  @JsonKey(defaultValue: 0, name: 'patients_served')
  final int patientsServed;
  @JsonKey(defaultValue: 0, name: 'years_of_experience')
  final int yearsOfExperience;
  @JsonKey(defaultValue: 0)
  final double rating;
  @JsonKey(defaultValue: 0, name: 'number_of_reviews')
  final int numberOfReviews;
  final Map<String, List<String>> availability;

  AvailableDoctors({
    required this.doctorName,
    required this.image,
    required this.speciality,
    required this.location,
    required this.patientsServed,
    required this.yearsOfExperience,
    required this.rating,
    required this.numberOfReviews,
    required this.availability,
  });

  factory AvailableDoctors.fromJson(Map<String, dynamic> json) =>
      _$AvailableDoctorsFromJson(json);
}
