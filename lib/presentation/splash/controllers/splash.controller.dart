import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wander_ways/presentation/components/components.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  final StorageService _storage = Get.find<StorageService>();
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
    await _setLocale();
    await logoAnimation.forward();
    _checkLoggedUser();
    super.onReady();
  }

  @override
  void onClose() {
    logoAnimation.dispose();
    super.onClose();
  }

  Future<Locale> _setLocale() async {
    return await _storage.setLocale();
  }

  Future<void> _checkLoggedUser() async {
    _storage.listUser.assignAll(await _storage.fetchAllUser());
    var loggedUser = await _storage.loadLoggedUser();
    if (loggedUser == "") return await Get.offAllNamed("/welcome");
    var index = _storage.listUser.indexWhere((u) => u.email == loggedUser);
    _storage.user.value = _storage.listUser[index];
    return await Get.offAllNamed(
      "/dashboard",
      arguments: {
        "language": _storage.language.value,
        "index": 0.obs,
      },
    );
  }
}
