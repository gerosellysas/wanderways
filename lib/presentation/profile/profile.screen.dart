import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/profile.controller.dart';
import 'widgets/profile.widgets.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (c) {
        return Obx(
          () => ProfileView(
            languageSelected: c.storage.language.value,
            user: Obx(() => ProfileUserCard(
                  user: c.storage.user.value,
                  onEditEmailTap: () => c.onEditUserTapped(true),
                  onEditPhoneTap: () => c.onEditUserTapped(false),
                )),
            settings: Obx(() => ProfileSettings(
                  languageSelected: c.storage.language.value,
                  onTap: c.onSignOutUser,
                  onLanguageChanged: c.onLanguageChanged,
                )),
            deleteButton: Obx(() => ProfielUserDeleteButton(
                  languageSelected: c.storage.language.value,
                  loading: c.loading.value,
                  onTap: c.onDeleteUser,
                )),
          ),
        );
      },
    );
  }
}
