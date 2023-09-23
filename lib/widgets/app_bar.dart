import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'reusable_text.dart';

AppBar buildAppBar(
  BuildContext context,
  String barTitle,
) {
  return AppBar(
    leading: Container(
      margin: EdgeInsets.all(6.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
        ),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        alignment: Alignment.center,
        color: Colors.black,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
        ),
      ),
    ),
    elevation: 0,
    centerTitle: true,
    title: ReuseableText(
      color: Colors.black,
      fontSize: 16.sp,
      fontWeight: FontWeight.normal,
      text: barTitle,
    ),
    toolbarHeight: 80,
  );
}
