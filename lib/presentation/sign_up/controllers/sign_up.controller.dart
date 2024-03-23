import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wander_ways/features/storage/domain/storage.domain.dart'
    show User;
import 'package:wander_ways/infrastructure/sources/extensions/extensions.dart';
import 'package:wander_ways/presentation/components/components.dart';

import '../overlays/sign_up.overlays.dart';

class SignUpController extends GetxController with WidgetsBindingObserver {
  final AppService app = Get.find<AppService>();
  final StorageService storage = Get.find<StorageService>();

  var fieldControllers = <TextEditingController>[];
  var fieldFocuses = <FocusNode>[];

  var fieldActives = <RxBool>[];
  var fieldEmpties = <RxBool>[];
  var fieldErrors = <RxBool>[];
  var obscures = [true.obs, true.obs];

  /// Variabel pertama untuk email yang sudah terdaftar. Variabel kedua untuk
  /// nomor telepon yang sudah terdaftar.
  var dataExist = [false.obs, false.obs];

  /// Variabel pertama untuk password kurang dari 8 karakter. Variabel kedua
  /// untuk password yang tidak memiliki minimal satu uppercase, satu lowercase
  /// dan satu spesial karakter.
  var passInvalid = [false.obs, false.obs];

  var loading = false.obs;

  @override
  void onInit() {
    for (var i = 0; i <= 5; i++) {
      fieldControllers.add(TextEditingController());
      fieldFocuses.add(FocusNode());
      fieldActives.add(false.obs);
      fieldEmpties.add(true.obs);
      fieldErrors.add(false.obs);
    }
    WidgetsBinding.instance.addObserver(this);
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
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    for (var i = 0; i < fieldFocuses.length; i++) {
      fieldActives[i].value = fieldFocuses[i].hasPrimaryFocus;
    }
    super.didChangeMetrics();
  }

  void onFieldChanged(String str, int index) {
    fieldEmpties[index].value = str.isEmpty;
    fieldErrors[index].value = false;
  }

  Future<void> onFieldSubmitted(int index) async {
    fieldActives[index].value = false;
    if (index == 5) return onSignUp();
    fieldFocuses[index + 1].requestFocus();
    fieldActives[index + 1].value = true;
  }

  void onFieldTapped(int index) {
    var activeIndex = fieldActives.indexWhere((active) => active == true.obs);
    if (activeIndex != -1) fieldActives[activeIndex].value = false;
    fieldFocuses[index].requestFocus();
    fieldActives[index].value = true;
  }

  Future<bool> _validateName(int nameIndex) async {
    return RegExp(r'^[a-zA-z]+([\s][a-zA-Z]+)*$').hasMatch(
      fieldControllers[nameIndex].text,
    );
  }

  Future<bool> _validateEmail() async {
    var validFormat = EmailValidator.validate(fieldControllers[2].text);
    if (!validFormat) return validFormat;
    var exist = storage.listUser.indexWhere(
      (u) => u.email == fieldControllers[2].text,
    );
    return !(dataExist[0].value = exist != -1);
  }

  Future<bool> _validatePhoneNumber() async {
    var validFormat = RegExp(r'^(?:[+0])?[0-9]{10,22}$').hasMatch(
      fieldControllers[3].text,
    );
    if (!validFormat) return validFormat;
    var exist = storage.listUser.indexWhere(
      (u) => u.phone == fieldControllers[3].text,
    );
    return !(dataExist[1].value = exist != -1);
  }

  Future<bool> _validatePassword() async {
    if (fieldControllers[4].text.length < 8) {
      passInvalid[0].value = true;
      passInvalid[1].value = false;
      return false;
    }
    bool hasUppercase = fieldControllers[4].text.contains(RegExp(r'^[A-Z]'));
    bool hasLowercase = fieldControllers[4].text.contains(RegExp(r'^[a-z]'));
    bool hasDigits = fieldControllers[4].text.contains(RegExp(r'^[0-9]'));
    bool hasSpecialCharacters =
        fieldControllers[4].text.contains(RegExp(r'^[!@#$%^&*(),.?":{}|<>]'));
    if (hasUppercase & hasLowercase & hasDigits & hasSpecialCharacters) {
      passInvalid[0].value = false;
      passInvalid[1].value = true;
      return false;
    }
    passInvalid[0].value = false;
    passInvalid[1].value = false;
    return true;
  }

  Future<bool> _validateConfirmPass() async {
    return fieldControllers[4].text == fieldControllers[5].text;
  }

  void onObscureTapped(int index) {
    obscures[index].toggle();
  }

  Future<bool> _validateSignUp() async {
    if (fieldErrors.every((error) => error == true.obs)) return false;
    if (fieldControllers.any((controller) => controller.text.isEmpty)) {
      for (var i = 0; i < fieldEmpties.length; i++) {
        fieldErrors[i].value = fieldEmpties[i].value;
      }
      return false;
    }
    return true;
  }

  Future<void> onSignUp() async {
    _validateSignUp().then((valid) async {
      if (!valid) return;
      FocusManager.instance.primaryFocus!.unfocus();
      for (var error in fieldErrors) {
        error.value = false;
      }
      loading.value = true;
      var firstNameValid = await _validateName(0);
      var lastNameValid = await _validateName(1);
      var emailValid = await _validateEmail();
      var phoneValid = await _validatePhoneNumber();
      var passValid = await _validatePassword();
      var confirmPassValid = await _validateConfirmPass();
      Future.delayed(const Duration(seconds: 2), () {
        fieldErrors[0].value = !firstNameValid;
        fieldErrors[1].value = !lastNameValid;
        fieldErrors[2].value = !emailValid;
        fieldErrors[3].value = !phoneValid;
        fieldErrors[4].value = !passValid;
        fieldErrors[5].value = !confirmPassValid;
        if (fieldErrors.contains(true.obs)) return loading.value = false;
        var user = User(
          firstName: fieldControllers[0].text.nameFormatter,
          lastName: fieldControllers[1].text.nameFormatter,
          email: fieldControllers[2].text,
          phone: fieldControllers[3].text,
          password: fieldControllers[4].text,
        );
        storage
            .upsertUser(user)
            .then((_) => storage.fetchAllUser())
            .then((users) => storage.listUser.assignAll(users))
            .then((_) => _onSuccessSignUp());
      });
    });
  }

  Future<void> _onSuccessSignUp() async {
    loading.value = false;
    await Get.off(
      () => Obx(() => SignUpSuccess(
            languageSelected: storage.language.value,
            onSignInTap: goToSignInScreen,
          )),
      routeName: "/sign_up_success",
      transition: Transition.cupertinoDialog,
      duration: const Duration(milliseconds: 250),
    );
  }

  Future<void> goToSignInScreen() async {
    await Get.offNamed("/sign_in");
  }
}
