import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/colors_manager.dart';

class AppTheme{
  static ThemeData darkTheme=ThemeData(
  appBarTheme: AppBarTheme(
  backgroundColor: Colors.transparent,
  elevation: 0,
  scrolledUnderElevation: 0
  ),
  colorScheme: ColorScheme.fromSeed(
  seedColor: ColorManager.primaryColor,
  primary: ColorManager.primaryColor
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(

  backgroundColor: ColorManager.primaryColor,
  unselectedItemColor: ColorManager.primaryColor,
  ),

  textTheme: TextTheme(

  labelMedium: TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w400,
  fontSize: 16.sp
  ),
  labelSmall: TextStyle(
  fontWeight:FontWeight.bold,
  fontSize: 20.sp,
  color: Colors.white
  ),
  labelLarge: TextStyle(
  fontWeight:FontWeight.w600,
  fontSize: 18.sp,
  color:Colors.white,

  ),
    bodySmall: TextStyle(
      fontWeight:FontWeight.bold,
      fontSize: 14.sp,
      color:ColorManager.ternaryColor,

    ),

  )
  );
}