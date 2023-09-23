import 'package:doc_appointment/models/appointment_history.dart';
import 'package:doc_appointment/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AppointmentHistoryPreviewScreen extends StatelessWidget {
  final AppointmentHistory appointmentHistory;
  const AppointmentHistoryPreviewScreen({
    required this.appointmentHistory,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 12.h,
      ),
      width: 375.w,
      height: 200.h,
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
          Container(
            margin: EdgeInsets.only(top: 12.h, bottom: 12.h, left: 8.h),
            child: ReuseableText(
              text:
                  '${DateFormat('MMM dd, yyyy').format(appointmentHistory.appointmentDate)} | ${appointmentHistory.appointmentTime}',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 12,
              right: 12,
            ),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color.fromARGB(255, 204, 204, 204),
                ),
                bottom: BorderSide(
                  color: Color.fromARGB(255, 204, 204, 204),
                ),
              ),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.only(top: 12.h, bottom: 14.h),
              leading: Container(
                margin: EdgeInsets.only(left: 12.w),
                padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                width: 60.w,
                height: 250.h,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.blue[100],
                ),
                child: const Icon(
                  Icons.person,
                  size: 32,
                ),
              ),
              title: ReuseableText(
                text: appointmentHistory.doctorName,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildExtraInfo(
                      icon: Icons.location_on_outlined,
                      infoText: appointmentHistory.location,
                    ),
                    SizedBox(height: 4.h),
                    buildExtraInfo(
                      icon: Icons.indeterminate_check_box_outlined,
                      infoText: 'Booking Id ${appointmentHistory.bookingId}',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: EdgeInsets.all(10.w),
                      backgroundColor: Colors.blue[100],
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(32),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: ReuseableText(
                      fontSize: 14.sp,
                      color: Colors.blue,
                      fontWeight: FontWeight.normal,
                      text: 'Cancel',
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: EdgeInsets.all(10.w),
                      backgroundColor: Colors.blue,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(32),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: ReuseableText(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      text: 'Reschedule',
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildExtraInfo({
    required IconData icon,
    required String infoText,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.blue,
        ),
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
