import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wander_ways/presentation/components/components.dart';

class SignUpController extends GetxController with WidgetsBindingObserver {
  final args = Get.arguments;
  final AppService app = Get.find<AppService>();

  List<TextEditingController> fieldControllers = [];
  List<FocusNode> fieldFocuses = [];

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

  Future<void> fetchUser() async {
    // todo: load user db
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
    // todo : check email exisiting from db
    return EmailValidator.validate(fieldControllers[2].text);
  }

  Future<bool> _validatePhoneNumber() async {
    // todo : check phone exisiting from db
    return RegExp(r'^(?:[+0])?[0-9]{10,22}$').hasMatch(
      fieldControllers[3].text,
    );
  }

  Future<bool> _validatePassword() async {
    if (fieldControllers[4].text.length < 8) {
      passInvalid[0].value = true;
      passInvalid[1].value = false;
      return false;
    }
    if (!(RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\W)$',
      caseSensitive: true,
    ).hasMatch(fieldControllers[4].text))) {
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
      Future.delayed(const Duration(seconds: 2), () async {
        loading.value = false;
        fieldErrors[0].value = !firstNameValid;
        fieldErrors[1].value = !lastNameValid;
        fieldErrors[2].value = !emailValid;
        fieldErrors[3].value = !phoneValid;
        fieldErrors[4].value = !passValid;
        fieldErrors[5].value = !confirmPassValid;
        if (fieldErrors.contains(true.obs)) return;
        // todo : insert user db
      });
    });
  }

  Future<void> goToSignInScreen() async {
    await Get.offNamed("/sign_in", arguments: args);
  }
}
