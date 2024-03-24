import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/schedule.controller.dart';
import 'widgets/schedule.widgets.dart';

class ScheduleReturnScreen extends GetView<ScheduleController> {
  const ScheduleReturnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (c) {
        return Obx(
          () => ScheduleView(
            languageSelected: c.home.storage.language.value,
            loading: c.home.scheduleLoadings[1].value,
            listEmpty: c.home.network.listReturnTrip.isEmpty,
            onBackTap: () => Get.back(),
            onReloadTap: () => c.onReloadTapped(1),
            route: [
              c.home.selectedLocations[1].value,
              c.home.selectedLocations[0].value,
            ],
            detail: Obx(() => ScheduleDetail(
                  languageSelected: c.home.storage.language.value,
                  date: c.newReturnDate.value ?? c.home.selectedDates[1].value,
                  seat: c.home.selectedSeat.value,
                  onTap: c.onDetailChangeTapped,
                )),
            list: Obx(() => ScheduleList(
                  languageSelected: c.home.storage.language.value,
                  locale: c.home.locale,
                  listTrip: c.home.network.listReturnTrip,
                  onTap: (index) => c.onReturnScheduleTap(index),
                )),
          ),
        );
      },
    );
  }
}
