import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:wander_ways/presentation/components/components.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';
import 'infrastructure/theme/theme.dart';

void main() async {
  Get.lazyPut<AppService>(() => AppService(), fenix: true);
  Get.lazyPut<StorageService>(() => StorageService(), fenix: true);
  var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(400, 800),
      minTextAdapt: true,
      splitScreenMode: false,
      child: MediaQuery(
        data: const MediaQueryData(textScaler: TextScaler.linear(1.0)),
        child: GetMaterialApp(
          theme: ThemeData(
            colorSchemeSeed: Hues.primary,
            fontFamily: "NunitoSans",
            useMaterial3: true,
          ),
          initialRoute: initialRoute,
          getPages: Nav.routes,
        ),
      ),
    );
  }
}
