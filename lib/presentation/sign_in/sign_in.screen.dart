import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wander_ways/presentation/sign_in/widgets/sign_in.widgets.dart';

import 'controllers/sign_in.controller.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (c) {
        return SignInView(
          onPop: c.onPopped,
          languageSelected: c.args,
          nameField: Obx(() => SignInEmailField(
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
          passwordField: Obx(() => SignInPasswordField(
                languageSelected: c.args,
                controller: c.fieldControllers[1],
                focusNode: c.fieldFocuses[1],
                isActive: c.fieldActives[1].value,
                isEmpty: c.fieldEmpties[1].value,
                isError: c.fieldErrors[1].value,
                obscure: c.obscure.value,
                onObscureTap: c.onObscureTapped,
                onChange: (str) => c.onFieldChanged(str, 1),
                onSubmit: (_) => c.onFieldSubmitted(1),
                onTap: () => c.onFieldTapped(1),
              )),
          navButton: Obx(() => SignInNavButton(
                languageSelected: c.args,
                loading: c.loading.value,
                onTap: c.onSignIn,
              )),
          onSignUpTap: c.goToSignUpScreen,
        );
      },
    );
  }
}
