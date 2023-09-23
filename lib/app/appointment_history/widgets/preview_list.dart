import 'package:doc_appointment/models/appointment_history.dart';
import 'package:doc_appointment/services/doctors_appointment.dart';
import 'package:doc_appointment/widgets/progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'preview.dart';

class AppointmentHistoryPreviewList extends StatelessWidget {
  const AppointmentHistoryPreviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AppointmentHistory>>(
      future: DoctorAppointmentService().getAppointmentHistory(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return buildCircularProgress();
        } else if (snapshot.hasData && snapshot.data != null) {
          final List<AppointmentHistory> appHistory = snapshot.data!;
          if (appHistory.isEmpty) {
            return _buildNoDataText();
          } else {
            return buildDoctorList(appHistory);
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
    );
  }

  Widget buildDoctorList(List<AppointmentHistory> history) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: history.length,
      itemBuilder: (context, index) {
        var doc = history[index];
        return AppointmentHistoryPreviewScreen(
          appointmentHistory: doc,
        );
      },
    );
  }

  Widget _buildNoDataText() {
    return const Center(
      child: Text('NO DATA'),
    );
  }
}
