import 'package:doc_appointment/app/appointment_history/screen.dart';
import 'package:doc_appointment/models/booking_confirm.dart';
import 'package:doc_appointment/widgets/custom_button.dart';
import 'package:doc_appointment/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ConfirmationPreviewScreen extends StatelessWidget {
  final BookingConfirm bookingConfirm;

  const ConfirmationPreviewScreen({
    required this.bookingConfirm,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildPhoto(),
        Padding(
          padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
          child: ReuseableText(
            fontSize: 16.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
            text: 'Appointment Confirmed',
          ),
        ),
        buildConfirmText(),
        buildLine(),
        SizedBox(height: 8.h),
        buildConfirmSummary(),
        SizedBox(height: 50.h),
        buildLine(),
        buildButton(context),
      ],
    );
  }

  Widget buildConfirmText() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: RichText(
        textAlign: TextAlign.center,
        maxLines: 2,
        text: TextSpan(children: [
          TextSpan(
            text: 'You Have successfully booked appointment with \t',
            style: GoogleFonts.roboto(
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
          ),
          TextSpan(
            text: bookingConfirm.doctorName,
            style: GoogleFonts.roboto(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          )
        ]),
      ),
    );
  }

  Widget buildPhoto() {
    return CircleAvatar(
      radius: 42.w,
      backgroundColor: Colors.blue,
      child: const ClipOval(
        child: AspectRatio(
          aspectRatio: 1,
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 38,
          ),
        ),
      ),
    );
  }

  Widget buildConfirmSummary() {
    return Container(
      margin: EdgeInsets.only(top: 12.h, bottom: 36.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildConfirm(
            headLine: bookingConfirm.location,
            iconData: Icons.person_2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildConfirm(
                headLine:
                    ' ${DateFormat('dd-MM-yyyy').format(bookingConfirm.appointmentDate)}',
                iconData: Icons.calendar_month_rounded,
              ),
              buildConfirm(
                headLine: bookingConfirm.appointmentTime,
                iconData: Icons.timer,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildConfirm({
    required String headLine,
    required IconData iconData,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14, left: 12, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconData,
            color: Colors.blue,
            size: 25,
          ),
          SizedBox(width: 6.w),
          ReuseableText(
            text: headLine,
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ],
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

  Widget buildButton(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AppointmentHistoryScreen(),
              ),
            );
          },
          buttonText: 'View Appointment',
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          child: ReuseableText(
            fontSize: 14.sp,
            color: Colors.blue,
            fontWeight: FontWeight.normal,
            text: 'Book Another',
          ),
        ),
      ],
    );
  }
}
