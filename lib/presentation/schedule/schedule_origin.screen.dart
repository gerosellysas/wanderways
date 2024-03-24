import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/schedule.controller.dart';
import 'widgets/schedule.widgets.dart';

class ScheduleOriginScreen extends GetView<ScheduleController> {
  const ScheduleOriginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (c) {
        return Obx(
          () => ScheduleView(
            languageSelected: c.home.storage.language.value,
            loading: c.home.scheduleLoadings[0].value,
            listEmpty: c.home.network.listTrip.isEmpty,
            onBackTap: () => Get.back(),
            onReloadTap: () => c.onReloadTapped(0),
            route: [
              c.home.selectedLocations[0].value,
              c.home.selectedLocations[1].value,
            ],
            detail: Obx(() => ScheduleDetail(
                  languageSelected: c.home.storage.language.value,
                  date: c.home.selectedDates[0].value,
                  seat: c.home.selectedSeat.value,
                  onTap: c.onDetailChangeTapped,
                )),
            list: Obx(() => ScheduleList(
                  languageSelected: c.home.storage.language.value,
                  locale: c.home.locale,
                  listTrip: c.home.network.listTrip,
                  onTap: (index) => c.onOriginScheduleTap(index),
                )),
          ),
        );
      },
    );
  }
}
