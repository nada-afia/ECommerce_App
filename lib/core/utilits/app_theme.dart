
import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_styles.dart';

class AppThem{

  static final ThemeData lightMode = ThemeData(
      scaffoldBackgroundColor: AppColors.primaryBackground,
      appBarTheme: const AppBarTheme(color:AppColors.primaryBackground),
      primaryColor: AppColors.blue,
      focusColor: AppColors.white,
      dividerColor: AppColors.white,
      shadowColor: AppColors.white,
      canvasColor: AppColors.black,
      cardColor: AppColors.white,
      iconTheme: const IconThemeData(color: Colors.blue, size: 20),
      textTheme:  TextTheme(
          headlineLarge: AppStyles.blueMed16,
          headlineMedium: AppStyles.blueBold16,
          headlineSmall: AppStyles.blackBold20,
          titleLarge: AppStyles.blackMed16,
          titleMedium: AppStyles.beigeBold24,
          titleSmall: AppStyles.whiteReg14,
          labelLarge: AppStyles.whiteMed16,
          labelMedium: AppStyles.whiteBold16,
          labelSmall: AppStyles.greyMed16
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.blue,
          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.white
      ),
      bottomSheetTheme: BottomSheetThemeData(

      )
  );

}