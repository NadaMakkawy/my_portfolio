import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

ThemeData kCustomTheme = ThemeData.dark().copyWith(
  iconTheme: const IconThemeData(
    color: CustomColor.whitePrimary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: CustomColor.yellowPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.sp),
      ),
      fixedSize: Size.fromHeight(45.h),
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16.sp,
      ),
    ),
  ),
);
