import 'package:cached_network_image/cached_network_image.dart';
import 'package:doc_appointment/models/available_doctor.dart';
import 'package:doc_appointment/widgets/app_bar.dart';
import 'package:doc_appointment/widgets/custom_button.dart';
import 'package:doc_appointment/widgets/format_date.dart';
import 'package:doc_appointment/widgets/reusable_text.dart';
import 'package:doc_appointment/widgets/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../package_details/screen.dart';
import 'widgets/details_widgets.dart';

class DoctorDetailsScreen extends StatefulWidget {
  final AvailableDoctors doctors;
  const DoctorDetailsScreen({
    required this.doctors,
    super.key,
  });

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  String selectedDate = '';
  String selectedTime = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(context, 'Book Appointment'),
          body: _buildBody(context),
          bottomNavigationBar: buildButton(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDoctorProfile(context),
            buildLine(),
            _buildExtraInfo(),
            buildAppointmentField(),
          ],
        ),
      ),
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

  Widget buildDoctorProfile(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildPhoto(),
        Expanded(
          child: ListTile(
            title: ReuseableText(
              text: widget.doctors.doctorName,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReuseableText(
                  text: widget.doctors.speciality,
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
                      text: widget.doctors.location,
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

  Widget _buildExtraInfo() {
    return Container(
      margin: EdgeInsets.only(top: 32.h, bottom: 16.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildReuseableIcons(Icons.supervisor_account_sharp,
                  "${widget.doctors.patientsServed.toString()}+", 'Patients'),
              buildReuseableIcons(
                  Icons.work_history,
                  '${widget.doctors.yearsOfExperience.toString()}+',
                  'Years Exp.'),
              buildReuseableIcons(
                Icons.star_purple500_rounded,
                widget.doctors.rating.toString(),
                'rating',
              ),
              buildReuseableIcons(
                Icons.chat_outlined,
                widget.doctors.numberOfReviews.toString(),
                'reviews',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildAppointmentField() {
    return Container(
      margin: EdgeInsets.only(top: 22.h, bottom: 12.h, left: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReuseableText(
            fontSize: 14.sp,
            color: const Color.fromARGB(255, 204, 204, 204),
            fontWeight: FontWeight.normal,
            text: 'BOOK APPOINTMENT',
          ),
          Container(
            margin: EdgeInsets.only(top: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReuseableText(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  text: 'Day',
                ),
                SizedBox(height: 4.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    runAlignment: WrapAlignment.start,
                    direction: Axis.horizontal,
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: widget.doctors.availability.keys.map((date) {
                      return ChoiceChip(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        selectedColor: Colors.blue,
                        label: Text(formatDate(date)),
                        selected: selectedDate == date,
                        onSelected: (selected) {
                          setState(() {
                            selectedDate = selected ? date : '';
                            selectedTime = '';
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReuseableText(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  text: 'Time',
                ),
                Wrap(
                  spacing: 8.0,
                  children: selectedDate.isNotEmpty
                      ? widget.doctors.availability[selectedDate]!
                          .map((timeSlot) {
                          return ChoiceChip(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            selectedColor: Colors.blue,
                            label: Text(timeSlot),
                            selected: selectedTime == timeSlot,
                            onSelected: (selected) {
                              setState(() {
                                selectedTime = selected ? timeSlot : '';
                              });
                            },
                          );
                        }).toList()
                      : [
                          ReuseableText(
                            fontSize: 12.sp,
                            color: Colors.grey.withOpacity(0.2),
                            fontWeight: FontWeight.bold,
                            text: 'Select day',
                          ),
                        ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  CustomButton buildButton(BuildContext context) {
    return CustomButton(
      onPressed: () {
        if (selectedDate.isEmpty || selectedTime.isEmpty) {
          toastWidget(msg: 'Please Select Date and Time ');
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PackageDetailScreen(
                doctors: widget.doctors,
                selectedDate: selectedDate,
                selectedTime: selectedTime,
              ),
            ),
          );
        }
      },
      buttonText: 'Make Appointment',
    );
  }

  Widget buildPhoto() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 50.w,
          child: ClipOval(
            child: AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                imageUrl: widget.doctors.image,
              ),
            ),
          ),
        ),
        const Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.check_circle_outlined,
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}
