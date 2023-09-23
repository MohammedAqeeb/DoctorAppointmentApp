import 'package:cached_network_image/cached_network_image.dart';
import 'package:doc_appointment/app/doctor_details/screen.dart';
import 'package:doc_appointment/widgets/reusable_text.dart';
import 'package:doc_appointment/models/available_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvailableDoctorsPreview extends StatelessWidget {
  final AvailableDoctors doctors;
  const AvailableDoctorsPreview({
    required this.doctors,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DoctorDetailsScreen(
              doctors: doctors,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          bottom: 8.h,
        ),
        width: 375.w,
        height: 160.h,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          border: Border.all(
            color: const Color.fromARGB(255, 204, 204, 204),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListTile(
                contentPadding: const EdgeInsets.only(top: 12),
                leading: CircleAvatar(
                  radius: 40.w,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 38.w,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: doctors.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                title: ReuseableText(
                  text: doctors.doctorName,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                subtitle: ReuseableText(
                  text: doctors.speciality,
                  color: const Color.fromARGB(255, 204, 204, 204),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16.w, top: 6.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildExtraInfo(
                      icon: Icons.star,
                      infoText:
                          "${doctors.yearsOfExperience.toString()} Years Of Experience",
                    ),
                    SizedBox(height: 2.h),
                    buildExtraInfo(
                      icon: Icons.rate_review,
                      infoText: '${doctors.numberOfReviews.toString()} Reviews',
                    ),
                    SizedBox(height: 2.h),
                    buildExtraInfo(
                      icon: Icons.location_on,
                      infoText: doctors.location,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildExtraInfo({
    required IconData icon,
    required String infoText,
  }) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 8.w),
        ReuseableText(
          text: infoText,
          color: Colors.black.withOpacity(0.5),
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
        ),
      ],
    );
  }
}
