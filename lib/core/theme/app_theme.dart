import 'package:blog_app/core/theme/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static final appTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    appBarTheme: AppBarTheme(backgroundColor: AppPallete.backgroundColor),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallete.gradient2),
      contentPadding: EdgeInsets.all(16.w),
    ),
  );
  static InputBorder _border([Color color = AppPallete.borderColor]) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: color, width: 3.w),
      );
}
