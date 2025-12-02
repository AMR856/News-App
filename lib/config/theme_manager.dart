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
        fontSize: 20.sp,
        color: ColorManager.black,
        fontWeight: FontWeight.w700,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 24.sp,
        color: ColorManager.black,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 30.sp,
        color: ColorManager.white,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12.sp,
        color: ColorManager.grey,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        color: ColorManager.black,
      ),
      bodyMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        fontSize: 14.sp,
        color: ColorManager.white,
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorManager.white,
      foregroundColor: ColorManager.black,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: ColorManager.white,
        foregroundColor: ColorManager.black,
      ),
    ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: GoogleFonts.inter(
          fontSize: 20.sp,
          color: ColorManager.black,
          fontWeight: FontWeight.w700,
        ),

        prefixIconColor: Colors.black,
        contentPadding: REdgeInsets.symmetric(
          vertical: 14.h,
          horizontal: 19.w,
        ),


        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
          borderSide: BorderSide(color: Colors.black, width: 1.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
          borderSide: BorderSide(color: Colors.black, width: 1.w),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
          borderSide: BorderSide(color: Colors.black, width: 1.w),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
          borderSide: BorderSide(color: Colors.black, width: 1.w),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
          borderSide: BorderSide(color: Colors.black, width: 1.w),
        ),

      ),
    iconTheme: IconThemeData(color: ColorManager.black),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: ColorManager.black),
    dialogTheme: DialogThemeData(
      backgroundColor: ColorManager.black
    )
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorManager.black,
    drawerTheme: DrawerThemeData(backgroundColor: ColorManager.black),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorManager.black,
      foregroundColor: ColorManager.white,
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.inter(
        fontSize: 40.sp,
        color: ColorManager.black,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 20.sp,
        color: ColorManager.white,
        fontWeight: FontWeight.w700,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 24.sp,
        color: ColorManager.white,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        color: ColorManager.white,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12.sp,
        color: ColorManager.grey,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        fontSize: 14.sp,
        color: ColorManager.black,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: ColorManager.black,
        foregroundColor: ColorManager.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.inter(
        fontSize: 20.sp,
        color: ColorManager.white,
        fontWeight: FontWeight.w700,
      ),

      prefixIconColor: ColorManager.white,
      contentPadding: REdgeInsets.symmetric(
        vertical: 14.h,
        horizontal: 19.w,
      ),


      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        borderSide: BorderSide(color: Colors.white, width: 1.w),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        borderSide: BorderSide(color: Colors.white, width: 1.w),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        borderSide: BorderSide(color: Colors.white, width: 1.w),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        borderSide: BorderSide(color: Colors.white, width: 1.w),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: Colors.white, width: 1.w),
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
        borderSide: BorderSide(color: ColorManager.white, width: 3.w),
      ),
    ),
    iconTheme: IconThemeData(color: ColorManager.white),
      dialogTheme: DialogThemeData(
          backgroundColor: ColorManager.white
      ),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: ColorManager.white),
  );
}
