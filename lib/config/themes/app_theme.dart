import 'package:flutter/material.dart';
import 'package:qoutes/core/utils/app_colors.dart';
import 'package:qoutes/core/utils/app_strings.dart';

ThemeData appTheme(){
  return ThemeData(
    primaryColor:AppColors.primary,
    hintColor:AppColors.hint,
    brightness:Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: AppStrings.fontFamily,
    appBarTheme:const AppBarTheme(centerTitle: true,
    color: Colors.transparent,
    elevation: 0.0,
      titleTextStyle: TextStyle(
        color:Colors.black,fontSize:20,
        fontWeight: FontWeight.w500,
     ),),
    textTheme:  const TextTheme(
      bodyMedium: TextStyle(
            height:1.5,
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
      // button: const TextStyle(
      //   fontSize: 16,
      //   color: Colors.black,
      //   fontWeight: FontWeight.bold,
      // )
    )
  );
}