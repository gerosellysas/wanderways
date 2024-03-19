import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController languageMenuAnimation;

  var language = 0.obs;

  @override
  void onInit() {
    languageMenuAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50),
      reverseDuration: const Duration(milliseconds: 50),
    );
    super.onInit();
  }

  @override
  void onReady() {
    //
    super.onReady();
  }

  @override
  void onClose() {
    languageMenuAnimation.dispose();
    super.onClose();
  }

  Future<void> onLanguageButtonTapped() async {
    if (languageMenuAnimation.status == AnimationStatus.dismissed) {
      languageMenuAnimation.forward();
      return;
    }
    languageMenuAnimation.reverse();
  }

  Future<void> onLanguageMenuTapped(int index) async {
    if (language.value == index) return;
    languageMenuAnimation.reverse();
    language.value = index;
  }

  Future<void> goToSignScreen(int index) async {
    await Get.toNamed(
      index == 0 ? "/sign_in" : "/sign_up",
      arguments: language.value,
    );
  }
}
