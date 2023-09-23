import 'package:doc_appointment/models/appointment_options.dart';
import 'package:doc_appointment/models/available_doctor.dart';
import 'package:doc_appointment/services/doctors_appointment.dart';
import 'package:doc_appointment/widgets/progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/app_bar.dart';
import 'widgets/preview.dart';

class PackageDetailScreen extends StatefulWidget {
  final AvailableDoctors doctors;
  final String selectedDate;
  final String selectedTime;

  const PackageDetailScreen({
    required this.doctors,
    required this.selectedDate,
    required this.selectedTime,
    super.key,
  });

  @override
  State<PackageDetailScreen> createState() => _PackageDetailScreenState();
}

class _PackageDetailScreenState extends State<PackageDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(context, 'Select Package'),
          body: buildBody(context),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 8.h, left: 16.w, right: 16.w),
        child: FutureBuilder(
          future: DoctorAppointmentService().getOption(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return buildCircularProgress();
            } else if (snapshot.hasData && snapshot.data != null) {
              final AppointmentOptions? appointmentOptions = snapshot.data;
              if (appointmentOptions == null) {
                return _buildNoDataText();
              } else {
                return PackagePreviewWidget(
                  doctors: widget.doctors,
                  appointmentOptions: appointmentOptions,
                  selectedDate: widget.selectedDate,
                  selectedTime: widget.selectedTime,
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
