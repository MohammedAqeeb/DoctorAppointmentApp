import 'package:doc_appointment/models/booking_confirm.dart';
import 'package:doc_appointment/services/doctors_appointment.dart';
import 'package:doc_appointment/widgets/app_bar.dart';
import 'package:doc_appointment/widgets/progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/preview.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(context, 'Confirmation'),
          body: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 32.h),
        child: FutureBuilder(
          future: DoctorAppointmentService().getBookingConfirm(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return buildCircularProgress();
            } else if (snapshot.hasData && snapshot.data != null) {
              final BookingConfirm? confirmBook = snapshot.data;
              if (confirmBook == null) {
                return _buildNoDataText();
              } else {
                return ConfirmationPreviewScreen(
                  bookingConfirm: confirmBook,
                );
              }
            } else if (snapshot.hasError) {
              return SizedBox(
                height: 150.h,
                child: Center(
                  child: Text(
                    snapshot.error.toString(),
                  ),
                ),
              );
            } else {
              return _buildNoDataText();
            }
          }),
        ),
      ),
    );
  }

  Widget _buildNoDataText() {
    return const Center(
      child: Text('NO DATA'),
    );
  }
}
