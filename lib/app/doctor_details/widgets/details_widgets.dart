import 'package:doc_appointment/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildReuseableIcons(
  IconData iconData,
  String headLine1,
  String headLine2,
) {
  return Column(
    children: [
      CircleAvatar(
        radius: 32,
        backgroundColor: Colors.blue.withOpacity(0.2),
        child: Icon(
          iconData,
          color: Colors.blue,
          size: 26,
        ),
      ),
      SizedBox(height: 6.h),
      ReuseableText(
        fontSize: 16.sp,
        color: Colors.blue,
        fontWeight: FontWeight.w600,
        text: headLine1,
      ),
      SizedBox(height: 2.h),
      ReuseableText(
        fontSize: 12.sp,
        color: const Color.fromARGB(255, 204, 204, 204),
        fontWeight: FontWeight.normal,
        text: headLine2,
      ),
    ],
  );
}
