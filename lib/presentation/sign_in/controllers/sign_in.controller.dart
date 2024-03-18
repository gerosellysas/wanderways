import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final args = Get.arguments;

  List<TextEditingController> fieldControllers = [];
  List<FocusNode> fieldFocuses = [];

  var fieldEmpties = [true.obs, true.obs];
  var fieldErrors = [false.obs, false.obs];
  var obscure = true.obs;
  var loading = false.obs;

  @override
  void onInit() {
    for (var i = 0; i < 2; i++) {
      fieldControllers.add(TextEditingController());
      fieldFocuses.add(FocusNode());
    }
    super.onInit();
  }

  @override
  void onReady() {
    //
    super.onReady();
  }

  @override
  void onClose() {
    for (var controller in fieldControllers) {
      controller.dispose();
    }
    for (var focus in fieldFocuses) {
      focus.dispose();
    }
    super.onClose();
  }

  void onFieldChanged(String str, int index) {
    fieldEmpties[index].value = str.isEmpty;
    fieldErrors[index].value = false;
  }

  Future<bool> _validateEmail() async {
    // todo: validate registered email from db
    return EmailValidator.validate(fieldControllers[0].text);
  }

  Future<bool> _validatePassword() async {
    // todo: validate password from registered email
    return fieldControllers[1].text == "123456";
  }

  void onObscureTapped() {
    obscure.toggle();
  }

  Future<bool> _validateSignIn() async {
    if (fieldErrors[0].value && fieldErrors[1].value) return false;
    if (fieldControllers[0].text.isEmpty || fieldControllers[1].text.isEmpty) {
      fieldEmpties[0].value = fieldControllers[0].text.isEmpty;
      fieldEmpties[1].value = fieldControllers[1].text.isEmpty;
      fieldErrors[0].value = fieldEmpties[0].value;
      fieldErrors[1].value = fieldEmpties[1].value;
      return false;
    }
    return true;
  }

  Future<void> onSignedIn() async {
    _validateSignIn().then((valid) async {
      if (!valid) return;
      FocusManager.instance.primaryFocus!.unfocus();
      fieldErrors[0].value = false;
      fieldErrors[1].value = false;
      loading.value = true;
      var emailValid = await _validateEmail();
      var passwordValid = await _validatePassword();
      Future.delayed(const Duration(seconds: 2), () async {
        loading.value = false;
        fieldErrors[0].value = !emailValid;
        fieldErrors[1].value = !passwordValid;
        if (fieldErrors.contains(true.obs)) return;
        Get.offAllNamed("/home", arguments: args);
      });
    });
  }

  Future<void> goToSignUpScreen() async {
    await Get.offNamed("/sign_up");
  }
}
