import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController logoAnimation;

  @override
  void onInit() {
    logoAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
      reverseDuration: const Duration(milliseconds: 3000),
    );
    super.onInit();
  }

  @override
  void onReady() async {
    logoAnimation.forward();
    super.onReady();
  }

  @override
  void onClose() {
    logoAnimation.dispose();
    super.onClose();
  }
}
