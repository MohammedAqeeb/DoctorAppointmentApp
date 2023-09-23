import 'package:cached_network_image/cached_network_image.dart';
import 'package:doc_appointment/app/confirmation/confirmation_screen.dart';
import 'package:doc_appointment/app/doctor_details/screen.dart';
import 'package:doc_appointment/models/available_doctor.dart';
import 'package:doc_appointment/widgets/app_bar.dart';
import 'package:doc_appointment/widgets/custom_button.dart';
import 'package:doc_appointment/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewScreen extends StatelessWidget {
  final AvailableDoctors doctors;
  final String selectedDate;
  final String selectedDuration;
  final String selectedTime;
  final String selectedPackage;
  const ReviewScreen({
    required this.doctors,
    required this.selectedDate,
    required this.selectedDuration,
    required this.selectedPackage,
    required this.selectedTime,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(context, 'Review Summary'),
          body: _buildBody(context),
          bottomNavigationBar: buildButton(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 32.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDoctorProfile(context),
            buildLine(),
            buildReviewSummary(context)
          ],
        ),
      ),
    );
  }

  Widget buildDoctorProfile(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildPhoto(),
        Expanded(
          child: ListTile(
            title: ReuseableText(
              text: doctors.doctorName,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReuseableText(
                  text: doctors.speciality,
                  color: const Color.fromARGB(255, 204, 204, 204),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: Colors.blue.withOpacity(0.6),
                    ),
                    ReuseableText(
                      text: doctors.location,
                      color: const Color.fromARGB(255, 204, 204, 204),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    Icon(
                      Icons.location_city,
                      color: Colors.blue.withOpacity(0.6),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildReviewSummary(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 30.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSummary(
            headLine: 'Date & Hour',
            dataText: "$selectedDate | $selectedTime",
            context: context,
            type: 'dateTime',
          ),
          buildSummary(
            headLine: 'Package',
            dataText: selectedPackage,
            context: context,
            type: 'package',
          ),
          buildSummary(
            headLine: 'Duration',
            dataText: selectedDuration,
            context: context,
            type: 'package',
          ),
          buildSummary(
            headLine: 'Booking For',
            dataText: 'Self',
            context: context,
            type: 'dateTime',
          ),
        ],
      ),
    );
  }

  Widget buildSummary({
    required String headLine,
    required String dataText,
    required BuildContext context,
    required String type,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 14, left: 12, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: ReuseableText(
              text: headLine,
              color: const Color.fromARGB(255, 204, 204, 204),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            flex: 10,
            child: ReuseableText(
              text: dataText,
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            flex: 2,
            child: IconButton(
              onPressed: () {
                if (type == 'package') {
                  Navigator.pop(context);
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          DoctorDetailsScreen(doctors: doctors),
                    ),
                  );
                }
              },
              icon: Icon(
                Icons.edit,
                color: Colors.grey.withOpacity(0.7),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    return CustomButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ConfirmationScreen(),
          ),
        );
      },
      buttonText: 'Confirm',
    );
  }

  Widget buildLine() {
    return Container(
      margin: EdgeInsets.only(top: 32.h),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: const Color.fromARGB(255, 204, 204, 204),
        ),
      ),
    );
  }

  Widget buildPhoto() {
    return CircleAvatar(
      radius: 50.w,
      child: ClipOval(
        child: AspectRatio(
          aspectRatio: 1,
          child: CachedNetworkImage(
            imageUrl: doctors.image,
          ),
        ),
      ),
    );
  }
}
