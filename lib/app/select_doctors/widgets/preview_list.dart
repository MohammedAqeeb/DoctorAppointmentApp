import 'package:doc_appointment/services/doctors_appointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/available_doctor.dart';
import '../../../widgets/progress.dart';
import 'preview.dart';

class AvailableDoctorsPreviewList extends StatelessWidget {
  const AvailableDoctorsPreviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AvailableDoctors>>(
      future: DoctorAppointmentService().getDoctorList(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return buildCircularProgress();
        } else if (snapshot.hasData && snapshot.data != null) {
          final List<AvailableDoctors> doc = snapshot.data!;
          if (doc.isEmpty) {
            return _buildNoDataText();
          } else {
            return buildDoctorList(doc);
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

  Widget buildDoctorList(List<AvailableDoctors> doctor) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: doctor.length,
      itemBuilder: (context, index) {
        var doc = doctor[index];
        return AvailableDoctorsPreview(
          doctors: doc,
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
