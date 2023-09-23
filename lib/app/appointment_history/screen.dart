import 'package:doc_appointment/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/preview_list.dart';

class AppointmentHistoryScreen extends StatelessWidget {
  const AppointmentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar(context),
          body: _buildBody(context),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: Colors.grey.withOpacity(0.3),
          height: 0.5,
        ),
      ),
      leading: Container(
        margin: EdgeInsets.all(6.w),
        decoration: BoxDecoration(
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
        text: 'My Bookings',
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 12.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_sharp,
              color: Colors.black,
            ),
          ),
        ),
      ],
      toolbarHeight: 80,
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 32.h,
        ),
        child: const AppointmentHistoryPreviewList(),
      ),
    );
  }
}
