import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/splash.controller.dart';
import 'widgets/splash.widgets.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (c) {
        return SplashView(
          children: [
            SplashLogoTag(animation: c.logoAnimation),
            SplashLogoText(animation: c.logoAnimation),
            SplashLogo(animation: c.logoAnimation),
          ],
        );
      },
    );
  }
}
