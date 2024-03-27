import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../infrastructure/sources/constants/constants.dart';
import '../infrastructure/theme/theme.dart';
import 'booking/controllers/booking.controller.dart';
import 'components/components.dart';
import 'home/controllers/home.controller.dart';
import 'profile/controllers/profile.controller.dart';
import 'screens.dart';

class DashboardScreen extends StatelessWidget {
  final AppService _app = Get.find<AppService>();
  final StorageService _storage = Get.find<StorageService>();

  DashboardScreen({super.key});

  Widget _tabIcon(String icon) => Container(
        height: 22.w,
        width: 28.w,
        alignment: Alignment.center,
        child: SvgPicture.asset(
          icon,
          fit: BoxFit.contain,
          height: 22.w,
          width: 28.w,
        ),
      );

  List<Widget> get _activeIcons => [
        _tabIcon(Images.tabHomeActive),
        _tabIcon(Images.tabBookingActive),
        _tabIcon(Images.tabInboxActive),
        _tabIcon(Images.tabProfileActive),
      ];

  List<Widget> get _inactiveIcons => [
        Transform.scale(
          scale: 0.8,
          child: _tabIcon(Images.tabHomeInactive),
        ),
        Transform.scale(
          scale: 0.8,
          child: _tabIcon(Images.tabBookingInactive),
        ),
        Transform.scale(
          scale: 0.8,
          child: _tabIcon(Images.tabInboxInactive),
        ),
        Transform.scale(
          scale: 0.8,
          child: _tabIcon(Images.tabProfileInactive),
        ),
      ];

  List<String> get _labels => [
        _storage.language.value == 0 ? "Beranda" : "Home",
        _storage.language.value == 0 ? "Pemesanan" : "Booking",
        _storage.language.value == 0 ? "Kotak Masuk" : "Inbox",
        _storage.language.value == 0 ? "Profil" : "Profile",
      ];

  List<Widget> get _screens => [
        const HomeScreen(),
        const BookingScreen(),
        Container(color: Hues.greyLightest),
        const ProfileScreen(),
      ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Hues.greyLightest,
        body: _screens[_app.screenIndex.value],
        bottomNavigationBar: Obx(
          () => AnimatedBottomNavigationBar.builder(
            backgroundColor: Hues.white,
            itemCount: 4,
            activeIndex: _app.screenIndex.value,
            gapWidth: 0,
            splashColor: Hues.accent,
            shadow: BoxShadow(
              offset: const Offset(0, -4),
              blurRadius: 4,
              color: Hues.black.withOpacity(0.16),
            ),
            tabBuilder: (index, isActive) {
              return Container(
                width: 1.sw,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isActive ? _activeIcons[index] : _inactiveIcons[index],
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        _labels[index],
                        style: isActive
                            ? Fonts.bold(color: Hues.accent, size: 12)
                            : Fonts.regular(color: Hues.greyDarkest, size: 10),
                      ),
                    )
                  ],
                ),
              );
            },
            onTap: (index) async {
              // switch (index) {
              //   case 1:
              //     Get.isRegistered<HomeController>()
              //         ? await Get.delete<HomeController>()
              //         : null;
              //     break;
              //   case 2:
              //     Get.isRegistered<HomeController>()
              //         ? await Get.delete<HomeController>()
              //         : null;
              //     Get.isRegistered<BookingController>()
              //         ? await Get.delete<BookingController>()
              //         : null;
              //     break;
              //   case 3:
              //     Get.isRegistered<HomeController>()
              //         ? await Get.delete<HomeController>()
              //         : null;
              //     Get.isRegistered<BookingController>()
              //         ? await Get.delete<BookingController>()
              //         : null;
              //     break;
              //   default:
              //     Get.isRegistered<BookingController>()
              //         ? await Get.delete<BookingController>()
              //         : null;
              // }
              _app.screenIndex.value = index;
              switch (index) {
                case 1:
                  // BookingControllerBinding().dependencies();
                  if (!(Get.isRegistered<BookingController>())) {
                    Get.lazyPut<BookingController>(() => BookingController());
                  } else {
                    Get.reload<BookingController>();
                  }
                  return;
                case 2:
                  return;
                case 3:
                  if (!(Get.isRegistered<ProfileController>())) {
                    Get.lazyPut<ProfileController>(() => ProfileController());
                  } else {
                    Get.reload<ProfileController>();
                  }
                  return;
                default:
                  // HomeControllerBinding().dependencies();
                  if (!(Get.isRegistered<HomeController>())) {
                    Get.lazyPut<HomeController>(() => HomeController());
                  } else {
                    Get.reload<HomeController>();
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}
