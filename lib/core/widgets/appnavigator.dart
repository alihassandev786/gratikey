import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AppNavigator {

  AppNavigator._();



  /// Normal Navigation
  /// Example:
  /// AppNavigator.push(HomeScreen());

  static Future<T?> push<T>(
      Widget page,
      ) async {

    return Get.to<T>(
          () => page,

      transition: Transition.rightToLeftWithFade,

      duration: const Duration(
        milliseconds: 450,
      ),

      curve: Curves.easeOutCubic,

      preventDuplicates: false,
    );
  }




  /// Replace Current Screen
  /// Example:
  /// AppNavigator.replace(HomeScreen());

  static Future<T?> replace<T>(
      Widget page,
      ) async {

    return Get.off<T>(
          () => page,

      transition: Transition.rightToLeftWithFade,

      duration: const Duration(
        milliseconds: 450,
      ),

      curve: Curves.easeOutCubic,
    );
  }




  /// Remove All Previous Screens
  /// Example:
  /// AppNavigator.clear(HomeScreen());

  static Future<T?> clear<T>(
      Widget page,
      ) async {

    return Get.offAll<T>(
          () => page,

      transition: Transition.fadeIn,

      duration: const Duration(
        milliseconds: 500,
      ),

      curve: Curves.easeOut,
    );
  }




  /// Fade Animation
  /// Example:
  /// AppNavigator.fade(ProfileScreen());

  static Future<T?> fade<T>(
      Widget page,
      ) async {

    return Get.to<T>(
          () => page,

      transition: Transition.fadeIn,

      duration: const Duration(
        milliseconds: 450,
      ),

      curve: Curves.easeInOut,
    );
  }


}