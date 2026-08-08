import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle titleLargeBold(BuildContext context) =>
      GoogleFonts.publicSans(
        fontSize: context.sp(40),
        fontWeight: FontWeight.bold,
        letterSpacing: -0.8,
      );

  static TextStyle subHeader(BuildContext context) => GoogleFonts.publicSans(
    fontSize: context.sp(20),
    fontWeight: FontWeight.w600,
  );

  static TextStyle smallTextSemiBold(BuildContext context) =>
      GoogleFonts.publicSans(
        fontSize: context.sp(12),
        fontWeight: FontWeight.w600,
      );

  static TextStyle pageHeaderText(BuildContext context) =>
      GoogleFonts.publicSans(
        fontSize: context.sp(16),
        fontWeight: FontWeight.w600,
      );

  static TextStyle primaryTextMedium(BuildContext context) =>
      GoogleFonts.publicSans(
        fontSize: context.sp(16),
        fontWeight: FontWeight.w500,
      );

  static TextStyle primaryTextSemiBold(BuildContext context) =>
      GoogleFonts.publicSans(
        fontSize: context.sp(16),
        fontWeight: FontWeight.w600,
      );

  static TextStyle primaryTextBold(BuildContext context) =>
      GoogleFonts.publicSans(
        fontSize: context.sp(16),
        fontWeight: FontWeight.bold,
      );

  static TextStyle primaryTextRegular(BuildContext context) =>
      GoogleFonts.publicSans(
        fontSize: context.sp(16),
        fontWeight: FontWeight.normal,
      );

  static TextStyle bodyTextRegular(BuildContext context) =>
      GoogleFonts.publicSans(
        fontSize: context.sp(14),
        fontWeight: FontWeight.normal,
      );
  static TextStyle bodyTextBold(BuildContext context) => GoogleFonts.publicSans(
    fontSize: context.sp(14),
    fontWeight: FontWeight.bold,
  );
}
