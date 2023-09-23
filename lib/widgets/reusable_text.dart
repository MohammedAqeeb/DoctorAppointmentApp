import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ReuseableText extends StatelessWidget {
  const ReuseableText(
      {super.key,
      required this.fontSize,
      required this.color,
      required this.fontWeight,
      required this.text});

  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
