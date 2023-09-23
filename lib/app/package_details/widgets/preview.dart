import 'package:doc_appointment/app/review_details/screen.dart';
import 'package:doc_appointment/models/appointment_options.dart';
import 'package:doc_appointment/models/available_doctor.dart';
import 'package:doc_appointment/widgets/custom_button.dart';
import 'package:doc_appointment/widgets/reusable_text.dart';
import 'package:doc_appointment/widgets/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackagePreviewWidget extends StatefulWidget {
  final AvailableDoctors doctors;
  final AppointmentOptions appointmentOptions;
  final String selectedDate;
  final String selectedTime;
  const PackagePreviewWidget({
    required this.doctors,
    required this.appointmentOptions,
    required this.selectedDate,
    required this.selectedTime,
    super.key,
  });

  @override
  State<PackagePreviewWidget> createState() => _PackagePreviewWidgetState();
}

class _PackagePreviewWidgetState extends State<PackagePreviewWidget> {
  String? selectedPackage;
  String? selectedDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDropDown(),
        SizedBox(height: 12.h),
        buildPackage(),
        SizedBox(height: 12.h),
        buildButton(context),
      ],
    );
  }

  Widget buildPackage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 6.h, bottom: 6.h),
          child: ReuseableText(
            fontSize: 15.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
            text: 'Select Package',
          ),
        ),
        buildListTiles(),
      ],
    );
  }

  Widget buildListTiles() {
    List<Widget> tileWidgets = [];

    List<IconData> icons = [
      Icons.chat_outlined,
      Icons.call_outlined,
      Icons.video_camera_front_rounded,
      Icons.person,
    ];

    List<String> subtitle = [
      'Chat with Doctor',
      'Voice Call with Doctor',
      'Video Call with Doctor',
      'In Person Visit with Doctor',
    ];

    for (int i = 0; i < widget.appointmentOptions.package.length; i++) {
      tileWidgets.add(
        Container(
          margin: EdgeInsets.only(top: 6.w),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(
                color: Color.fromARGB(255, 204, 204, 204),
              ),
            ),
            leading: CircleAvatar(
              radius: 32,
              backgroundColor: Colors.blue.withOpacity(0.2),
              child: Icon(
                icons[i],
                color: Colors.blue,
                size: 26,
              ),
            ),
            title: ReuseableText(
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              text: widget.appointmentOptions.package[i],
            ),
            subtitle: ReuseableText(
              fontSize: 12.sp,
              color: Colors.grey.withOpacity(0.5),
              fontWeight: FontWeight.normal,
              text: subtitle[i],
            ),
            trailing: Transform.scale(
              scale: 1.3,
              child: Radio<String>(
                value: widget.appointmentOptions.package[i],
                groupValue: selectedPackage,
                onChanged: (String? value) {
                  setState(() {
                    selectedPackage = value;
                  });
                },
                activeColor: Colors.blue,
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      children: tileWidgets,
    );
  }

  Widget buildDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 14.h, bottom: 14.h),
          child: ReuseableText(
            fontSize: 15.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
            text: 'Select Duration',
          ),
        ),
        DropdownButtonFormField(
          hint: const Text('Select Duration'),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 204, 204, 204),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          dropdownColor: Colors.white,
          value: selectedDuration,
          onChanged: (String? newValue) {
            setState(() {
              selectedDuration = newValue!;
            });
          },
          items: getPackageItems(widget.appointmentOptions.duration),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getPackageItems(List<String> options) {
    return options.map((String option) {
      return DropdownMenuItem<String>(
        value: option,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.timer,
              color: Colors.blue,
            ),
            SizedBox(width: 4.w),
            Text(option),
          ],
        ),
      );
    }).toList();
  }

  Widget buildButton(BuildContext context) {
    return CustomButton(
      onPressed: () {
        if (selectedDuration == null || selectedPackage == null) {
          toastWidget(msg: 'Please Select Duration and Package');
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReviewScreen(
                doctors: widget.doctors,
                selectedDate: widget.selectedDate,
                selectedTime: widget.selectedTime,
                selectedDuration: selectedDuration!,
                selectedPackage: selectedPackage!,

              ),
            ),
          );
        }
      },
      buttonText: 'Next',
    );
  }
}
