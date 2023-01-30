import 'package:flutter/material.dart';
import 'package:movie_app/presentation/presentation_managers/color_manager.dart';
import 'package:movie_app/presentation/presentation_managers/font_manager.dart';
import 'package:movie_app/presentation/presentation_managers/style_manager.dart';
import 'package:movie_app/presentation/presentation_managers/values_managers.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
  primaryColor: ColorManager.primaryColor,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.primaryColor,
    scaffoldBackgroundColor: const Color(0xFF151C26),
    // ripple effect color
    // cardview theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
    // app bar theme
    appBarTheme: AppBarTheme(
      backgroundColor:const Color(0xFF151C26),
        centerTitle: true,
        // color: ColorManager.primaryColor,
        elevation: AppSize.s4,
        // shadowColor: ColorManager.lightPrimary,
        titleTextStyle: getRegularStyle(fontSize: FontSize.s18, color: ColorManager.white,)),

    // button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primaryColor,
        splashColor: ColorManager.lightPrimary),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManager.white,
          fontSize: FontSize.s17,
        ),
        backgroundColor: ColorManager.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    // text theme
    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
      headlineLarge: getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
      headlineMedium: getRegularStyle(color: ColorManager.darkGrey, fontSize: FontSize.s14),
      titleMedium: getMediumStyle(color: ColorManager.primaryColor, fontSize: FontSize.s16),
      titleSmall: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
      bodyLarge: getRegularStyle(color: ColorManager.grey1),
      bodySmall: getRegularStyle(color: ColorManager.grey),
      bodyMedium: getRegularStyle(color: ColorManager.grey2, fontSize: FontSize.s12),
      labelSmall: getBoldStyle(color: ColorManager.primaryColor, fontSize: FontSize.s14),
      labelMedium: getBoldStyle(color: ColorManager.primaryColor, fontSize: FontSize.s35),
    ),

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: ColorManager.primaryColor,
    ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      // content padding
      contentPadding: const EdgeInsets.all(AppPadding.p18),

      // hint style
      hintStyle: getRegularStyle(color: ColorManager.lightGrey, fontSize: FontSize.s17),
      labelStyle: getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.s17),
      errorStyle: getRegularStyle(color: ColorManager.error),

      // enabled border style
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.lightGrey, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),

      // focused border style
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primaryColor, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),

      // error border style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),

      // focused border style
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primaryColor, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
    ),
  );
}
