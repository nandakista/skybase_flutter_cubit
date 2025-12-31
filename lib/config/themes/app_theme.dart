import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skybase/config/themes/app_colors.dart';

import 'app_typography.dart';
import 'default_typography.dart';
import 'generated/fonts.gen.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        surfaceTint: Colors.white,
        brightness: Brightness.light,
      ),
      fontFamily: FontFamily.poppins,
      inputDecorationTheme: inputDecorationTheme(),
      checkboxTheme: checkboxThemeData(),
      radioTheme: radioThemeData(),
      switchTheme: switchThemeData(),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
      ),
      appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          statusBarColor: AppColors.primary,
        ),
      ),
      tabBarTheme: TabBarThemeData(indicatorColor: AppColors.secondary),
      textTheme: TextTheme(
        displayLarge: DefaultTypography.displayLarge,
        displayMedium: DefaultTypography.displayMedium,
        titleSmall: DefaultTypography.titleSmall,
        bodyLarge: DefaultTypography.bodyLarge,
        bodyMedium: DefaultTypography.bodyMedium,
        bodySmall: DefaultTypography.bodySmall,
        labelLarge: DefaultTypography.labelLarge,
        labelMedium: DefaultTypography.labelMedium,
        labelSmall: DefaultTypography.labelSmall,
      ),
      extensions: [
        AppTypography(
          headline1: const TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
          headline2: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
          headline3: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          headline4: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          title1: const TextStyle(fontSize: 40),
          title2: const TextStyle(fontSize: 34),
          title3: const TextStyle(fontSize: 30),
          title4: const TextStyle(fontSize: 28),
          subtitle1: const TextStyle(fontSize: 24),
          subtitle2: const TextStyle(fontSize: 20),
          subtitle3: const TextStyle(fontSize: 18),
          subtitle4: const TextStyle(fontSize: 16),
          body1: const TextStyle(fontSize: 14),
          body2: const TextStyle(fontSize: 13),
          body3: const TextStyle(fontSize: 11),
          small: const TextStyle(fontSize: 9),
          verySmall: const TextStyle(fontSize: 8),
          link: const TextStyle(fontSize: 18, color: Colors.blue),
        ),
      ],
    );
  }

  static ThemeData get dark {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        surfaceTint: Colors.transparent,
        brightness: Brightness.dark,
      ),
      fontFamily: FontFamily.poppins,
      inputDecorationTheme: inputDecorationTheme(),
      checkboxTheme: checkboxThemeData(),
      radioTheme: radioThemeData(),
      switchTheme: switchThemeData(),
      bottomSheetTheme: const BottomSheetThemeData(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        elevation: 2,
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness:
              Platform.isIOS || Platform.isMacOS
                  ? Brightness.dark
                  : Brightness.light,
          systemNavigationBarColor: Colors.black,
          statusBarColor: AppColors.primary,
        ),
      ),
      tabBarTheme: TabBarThemeData(indicatorColor: AppColors.secondary),
      textTheme: TextTheme(
        displayLarge: DefaultTypography.displayLarge,
        displayMedium: DefaultTypography.displayMedium,
        titleSmall: DefaultTypography.titleSmall,
        bodyLarge: DefaultTypography.bodyLarge,
        bodyMedium: DefaultTypography.bodyMedium,
        bodySmall: DefaultTypography.bodySmall,
        labelLarge: DefaultTypography.labelLarge,
        labelMedium: DefaultTypography.labelMedium,
        labelSmall: DefaultTypography.labelSmall,
      ),
      extensions: [
        AppTypography(
          headline1: const TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
          headline2: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
          headline3: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          headline4: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          title1: const TextStyle(fontSize: 40),
          title2: const TextStyle(fontSize: 34),
          title3: const TextStyle(fontSize: 30),
          title4: const TextStyle(fontSize: 28),
          subtitle1: const TextStyle(fontSize: 24),
          subtitle2: const TextStyle(fontSize: 20),
          subtitle3: const TextStyle(fontSize: 18),
          subtitle4: const TextStyle(fontSize: 16),
          body1: const TextStyle(fontSize: 14),
          body2: const TextStyle(fontSize: 13),
          body3: const TextStyle(fontSize: 11),
          small: const TextStyle(fontSize: 9),
          verySmall: const TextStyle(fontSize: 8),
          link: const TextStyle(fontSize: 18, color: Colors.blue),
        ),
      ],
    );
  }

  static CheckboxThemeData checkboxThemeData() {
    return CheckboxThemeData(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      side: const BorderSide(width: 1, color: Color(0xFFCFCFCF)),
      fillColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return AppColors.secondary;
        }
        return null;
      }),
    );
  }

  static RadioThemeData radioThemeData() {
    return RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return AppColors.secondary;
        }
        return null;
      }),
    );
  }

  static SwitchThemeData switchThemeData() {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return null;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return AppColors.secondary;
        }
        return null;
      }),
    );
  }

  static InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Colors.transparent),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Colors.transparent),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: AppColors.primary),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: AppColors.primary),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class AppOrientation {
  static Future<void> lock(DeviceOrientation orientation) {
    return SystemChrome.setPreferredOrientations([orientation]);
  }
}
