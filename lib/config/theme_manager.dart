import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/resources/color_manager.dart';

abstract class ThemeManager {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorManager.white,
    drawerTheme: DrawerThemeData(backgroundColor: ColorManager.black),
    textTheme: TextTheme(
      headlineMedium: GoogleFonts.inter(
        fontSize: 20,
        color: ColorManager.black,
        fontWeight: FontWeight.w700,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 24,
        color: ColorManager.black,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: GoogleFonts.inter(
          fontSize: 30,
          color: ColorManager.white,
          fontWeight: FontWeight.w500
      ),
    ),
    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: ColorManager.white,
        foregroundColor: ColorManager.black,
    ),

    iconTheme: IconThemeData(color: ColorManager.black),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorManager.black,
    drawerTheme: DrawerThemeData(backgroundColor: ColorManager.black),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorManager.black,
      foregroundColor: ColorManager.white
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.inter(
        fontSize: 40,
        color: ColorManager.black,
        fontWeight: FontWeight.w700
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 20,
        color: ColorManager.white,
        fontWeight: FontWeight.w700,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 24,
        color: ColorManager.white,
        fontWeight: FontWeight.w700,
      ),
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: ColorManager.white,
      labelStyle: GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
      ),
      unselectedLabelStyle: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
      ),
      unselectedLabelColor: ColorManager.white,
      dividerColor: Colors.transparent,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: ColorManager.white,
          width: 3,
        ),
      ),
    ),
    iconTheme: IconThemeData(color: ColorManager.white),
  );
}
