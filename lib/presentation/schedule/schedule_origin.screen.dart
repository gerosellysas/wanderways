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
            languageSelected: c.storage.language.value,
            loading: c.home.scheduleLoadings[0].value,
            listEmpty: c.network.listTrip.isEmpty,
            onBackTap: () => Get.back(),
            onReloadTap: () => c.onReloadTapped(0),
            route: c.home.originRoute,
            detail: Obx(() => ScheduleDetail(
                  languageSelected: c.storage.language.value,
                  date: c.home.selectedDates[0].value,
                  seat: c.home.selectedSeat.value,
                  onTap: c.onDetailChangeTapped,
                )),
            list: Obx(() => ScheduleList(
                  languageSelected: c.storage.language.value,
                  locale: c.home.locale,
                  listTrip: c.network.listTrip,
                  onTap: (index) => c.onOriginScheduleTap(index),
                )),
          ),
        );
      },
    );
  }
}
