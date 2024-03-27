import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/profile.controller.dart';
import 'widgets/profile.widgets.dart';

class ProfileUserScreen extends GetView<ProfileController> {
  const ProfileUserScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (c) {
        return Obx(
          () => ProfileUserView(
            languageSelected: c.storage.language.value,
            isEmail: c.editEmail.value,
            emailField: Obx(() => ProfileUserEmailField(
                  languageSelected: c.storage.language.value,
                  controller: c.fieldControllers[0],
                  focusNode: c.fieldFocuses[0],
                  isActive: c.fieldActives[0].value,
                  isEmpty: c.fieldEmpties[0].value,
                  isError: c.fieldErrors[0].value,
                  isExist: c.dataExist[0].value,
                  onTap: () => c.onFieldTapped(0),
                  onChange: (str) => c.onFieldChanged(str, 0),
                  onSubmit: (_) => c.onFieldSubmitted(0),
                )),
            phoneField: Obx(() => ProfileUserPhoneField(
                  languageSelected: c.storage.language.value,
                  controller: c.fieldControllers[1],
                  focusNode: c.fieldFocuses[1],
                  isActive: c.fieldActives[1].value,
                  isEmpty: c.fieldEmpties[1].value,
                  isError: c.fieldErrors[1].value,
                  isExist: c.dataExist[1].value,
                  onTap: () => c.onFieldTapped(1),
                  onChange: (str) => c.onFieldChanged(str, 1),
                  onSubmit: (_) => c.onFieldSubmitted(1),
                )),
            updateButton: Obx(() => ProfielUserUpdateButton(
                  languageSelected: c.storage.language.value,
                  loading: c.loading.value,
                  onTap: c.onUpdateUser,
                )),
          ),
        );
      },
    );
  }
}
