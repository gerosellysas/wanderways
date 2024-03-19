import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/sign_up.controller.dart';
import 'widgets/sign_up.widgets.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: controller,
        builder: (c) {
          return SignUpView(
            firstNameField: Obx(() => SignUpFirstNameField(
                  languageSelected: c.args,
                  controller: c.fieldControllers[0],
                  focusNode: c.fieldFocuses[0],
                  isActive: c.fieldActives[0].value,
                  isEmpty: c.fieldEmpties[0].value,
                  isError: c.fieldErrors[0].value,
                  onChange: (str) => c.onFieldChanged(str, 0),
                  onSubmit: (_) => c.onFieldSubmitted(0),
                  onTap: () => c.onFieldTapped(0),
                )),
            lastNameField: Obx(() => SignUpLastNameField(
                  languageSelected: c.args,
                  controller: c.fieldControllers[1],
                  focusNode: c.fieldFocuses[1],
                  isActive: c.fieldActives[1].value,
                  isEmpty: c.fieldEmpties[1].value,
                  isError: c.fieldErrors[1].value,
                  onChange: (str) => c.onFieldChanged(str, 1),
                  onSubmit: (_) => c.onFieldSubmitted(1),
                  onTap: () => c.onFieldTapped(1),
                )),
            emailField: Obx(() => SignUpEmailField(
                  languageSelected: c.args,
                  controller: c.fieldControllers[2],
                  focusNode: c.fieldFocuses[2],
                  isActive: c.fieldActives[2].value,
                  isEmpty: c.fieldEmpties[2].value,
                  isExist: c.dataExist[0].value,
                  isError: c.fieldErrors[2].value,
                  onChange: (str) => c.onFieldChanged(str, 2),
                  onSubmit: (_) => c.onFieldSubmitted(2),
                  onTap: () => c.onFieldTapped(2),
                )),
            phoneField: Obx(() => SignUpPhoneField(
                  languageSelected: c.args,
                  controller: c.fieldControllers[3],
                  focusNode: c.fieldFocuses[3],
                  isActive: c.fieldActives[3].value,
                  isEmpty: c.fieldEmpties[3].value,
                  isExist: c.dataExist[1].value,
                  isError: c.fieldErrors[3].value,
                  onChange: (str) => c.onFieldChanged(str, 3),
                  onSubmit: (_) => c.onFieldSubmitted(3),
                  onTap: () => c.onFieldTapped(3),
                )),
            passwordField: Obx(() => SignUpPasswordField(
                  languageSelected: c.args,
                  controller: c.fieldControllers[4],
                  focusNode: c.fieldFocuses[4],
                  isActive: c.fieldActives[4].value,
                  isEmpty: c.fieldEmpties[4].value,
                  isLess: c.passInvalid[0].value,
                  isWeak: c.passInvalid[1].value,
                  isError: c.fieldErrors[4].value,
                  obscure: c.obscures[0].value,
                  onObscureTap: () => c.onObscureTapped(0),
                  onChange: (str) => c.onFieldChanged(str, 4),
                  onSubmit: (_) => c.onFieldSubmitted(4),
                  onTap: () => c.onFieldTapped(4),
                )),
            confirmPassField: Obx(() => SignUpConfirmPassField(
                  languageSelected: c.args,
                  controller: c.fieldControllers[5],
                  focusNode: c.fieldFocuses[5],
                  isActive: c.fieldActives[5].value,
                  isEmpty: c.fieldEmpties[5].value,
                  isError: c.fieldErrors[5].value,
                  obscure: c.obscures[1].value,
                  onObscureTap: () => c.onObscureTapped(1),
                  onChange: (str) => c.onFieldChanged(str, 5),
                  onSubmit: (_) => c.onFieldSubmitted(5),
                  onTap: () => c.onFieldTapped(5),
                )),
            navButton: Obx(() => SignUpNavButton(
                  languageSelected: c.args,
                  loading: c.loading.value,
                  onTap: c.onSignUp,
                )),
            onSignInTap: c.goToSignInScreen,
          );
        });
  }
}
