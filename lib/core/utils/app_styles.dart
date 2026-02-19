import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppStyles{
  static final TextStyle regular20Black = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );
  static final TextStyle regular20White = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  static final TextStyle regular15White = GoogleFonts.roboto(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  static final regular16Yellow = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.accentYellow, 
  );
  static final TextStyle regular16AccentYellow = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.accentYellow,
  );
}