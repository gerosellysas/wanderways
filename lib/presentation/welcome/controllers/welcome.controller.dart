import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wander_ways/presentation/components/components.dart';

class WelcomeController extends GetxController
    with GetTickerProviderStateMixin {
  final StorageService storage = Get.find<StorageService>();
  late AnimationController languageMenuAnimation;

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
      return languageMenuAnimation.forward();
    }
    languageMenuAnimation.reverse();
  }

  Future<void> onLanguageMenuTapped(int index) async {
    if (storage.language.value == index) return;
    languageMenuAnimation.reverse();
    await storage.savePrefLanguage(index);
    await storage.setLocale();
  }

  Future<void> goToSignScreen(int index) async {
    languageMenuAnimation.reverse();
    await Get.toNamed(index == 0 ? "/sign_in" : "/sign_up");
  }
}
