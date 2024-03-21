import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wander_ways/presentation/components/components.dart';

class WelcomeController extends GetxController
    with GetTickerProviderStateMixin {
  final args = Get.arguments;
  final StorageService _storage = Get.find<StorageService>();
  late AnimationController languageMenuAnimation;

  var language = 0.obs;

  @override
  void onInit() {
    language.value = args;
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
    await _storage.savePrefLanguage(index);
    language.value = await _storage.loadPrefLanguage();
  }

  Future<void> goToSignScreen(int index) async {
    await Get.toNamed(
      index == 0 ? "/sign_in" : "/sign_up",
      arguments: language.value,
    );
  }
}
