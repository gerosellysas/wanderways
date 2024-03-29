import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:get/get.dart';

import '../../infrastructure/sources/enums/enums.dart';
import 'controllers/welcome.controller.dart';
import 'widgets/welcome.widgets.dart';

class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.25;
    return GetBuilder(
      init: controller,
      builder: (c) {
        return Obx(
          () => WelcomeView(
            selectedLanguage: c.storage.language.value,
            languageMenuAnimation: c.languageMenuAnimation,
            onBarrierTap: () => c.languageMenuAnimation.reverse(),
            languageButton: WelcomeLanguage(
              animation: c.languageMenuAnimation,
              selectedLanguage: c.storage.language.value,
              onTap: () => c.onLanguageButtonTapped(),
              onMenuTap: (index) => c.onLanguageMenuTapped(index!),
            ),
            signInNav: WelcomeNavButton(
              selectedLanguage: c.storage.language.value,
              style: NavButtonStyle.fill,
              onTap: () => c.goToSignScreen(0),
            ),
            signUpNav: WelcomeNavButton(
              selectedLanguage: c.storage.language.value,
              style: NavButtonStyle.outline,
              onTap: () => c.goToSignScreen(1),
            ),
          ),
        );
      },
    );
  }
}
