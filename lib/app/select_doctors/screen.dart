import 'package:doc_appointment/app/select_doctors/widgets/preview_list.dart';
import 'package:doc_appointment/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: ReuseableText(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              text: 'Doctors',
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Container(
                color: Colors.grey.withOpacity(0.5),
                height: 0.8,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 14.h,
                    left: 18.w,
                    bottom: 12.h,
                  ),
                  child: ReuseableText(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    text: 'Book Appointment',
                  ),
                ),

                const AvailableDoctorsPreviewList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
