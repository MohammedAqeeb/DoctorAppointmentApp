import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'reusable_text.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonText;
  const CustomButton({
    required this.onPressed,
    required this.buttonText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 32.h,
        left: 16.w,
        right: 16.w,
        bottom: 16.h,
      ),
      child: SizedBox(
        width: 375.w,
        height: 50.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
          ),
          onPressed: onPressed,
          child: ReuseableText(
            fontSize: 14.sp,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            text: buttonText,
          ),
        ),
      ),
    );
  }
}
