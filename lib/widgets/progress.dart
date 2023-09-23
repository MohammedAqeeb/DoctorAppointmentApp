import 'package:flutter/material.dart';

Widget buildCircularProgress() {
  return Center(
    child: CircularProgressIndicator(
      color: Colors.white,
      backgroundColor: Colors.blue.withOpacity(0.5),
    ),
  );
}


