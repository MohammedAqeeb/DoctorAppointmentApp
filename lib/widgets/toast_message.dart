import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastWidget({
  required String msg,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    backgroundColor: const Color.fromARGB(210, 32, 47, 62),
    fontSize: 12.sp,
    gravity: ToastGravity.TOP,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 5,
  );
}
