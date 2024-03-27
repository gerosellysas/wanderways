import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wander_ways/presentation/components/components.dart';

class ProfileController extends GetxController with WidgetsBindingObserver {
  final AppService app = Get.find<AppService>();
  final StorageService storage = Get.find<StorageService>();
  final NetworkService network = Get.find<NetworkService>();

  var editEmail = true.obs;

  var fieldControllers = <TextEditingController>[];
  var fieldFocuses = <FocusNode>[];

  var fieldActives = <RxBool>[];
  var fieldEmpties = <RxBool>[];
  var fieldErrors = <RxBool>[];

  /// Variabel pertama untuk email yang sudah terdaftar. Variabel kedua untuk
  /// nomor telepon yang sudah terdaftar.
  var dataExist = [false.obs, false.obs];

  var loading = false.obs;

  @override
  void onInit() {
    for (var i = 0; i < 2; i++) {
      fieldControllers.add(TextEditingController());
      fieldFocuses.add(FocusNode());
      fieldActives.add(false.obs);
      fieldEmpties.add(false.obs);
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

  Future<void> onEditUserTapped(bool isEmail) async {
    editEmail.value = isEmail;
    fieldActives.assignAll([false.obs, false.obs]);
    fieldEmpties.assignAll([false.obs, false.obs]);
    fieldErrors.assignAll([false.obs, false.obs]);
    fieldControllers[0].text = storage.user.value.email!;
    fieldControllers[1].text = storage.user.value.phone!;
    await Get.toNamed("/profile_user");
  }

  void onFieldChanged(String str, int index) {
    fieldEmpties[index].value = str.isEmpty;
    fieldErrors[index].value = false;
  }

  Future<void> onFieldSubmitted(int index) async {
    fieldActives[index].value = false;
    onUpdateUser();
  }

  void onFieldTapped(int index) {
    fieldFocuses[index].requestFocus();
    fieldActives[index].value = true;
  }

  Future<bool> _validateEmail() async {
    var validFormat = EmailValidator.validate(fieldControllers[0].text);
    if (!validFormat) return validFormat;
    var exist = storage.listUser.indexWhere(
      (u) => u.email == fieldControllers[0].text,
    );
    return !(dataExist[0].value = exist != -1);
  }

  Future<bool> _validatePhoneNumber() async {
    var validFormat = RegExp(r'^(?:[+0])?[0-9]{10,22}$').hasMatch(
      fieldControllers[1].text,
    );
    if (!validFormat) return validFormat;
    var exist = storage.listUser.indexWhere(
      (u) => u.phone == fieldControllers[1].text,
    );
    return !(dataExist[1].value = exist != -1);
  }

  Future<bool> _validateUpdateUser() async {
    if (fieldErrors.every((error) => error == true.obs)) return false;
    if (fieldControllers.any((controller) => controller.text.isEmpty)) {
      for (var i = 0; i < fieldEmpties.length; i++) {
        fieldErrors[i].value = fieldEmpties[i].value;
      }
      return false;
    }
    return true;
  }

  Future<void> onUpdateUser() async {
    _validateUpdateUser().then((valid) async {
      if (!valid) return;
      FocusManager.instance.primaryFocus!.unfocus();
      for (var error in fieldErrors) {
        error.value = false;
      }
      loading.value = true;
      var emailValid = true;
      var phoneValid = true;
      if (editEmail.value) emailValid = await _validateEmail();
      if (!editEmail.value) phoneValid = await _validatePhoneNumber();
      Future.delayed(const Duration(seconds: 2), () async {
        if (editEmail.value) fieldErrors[0].value = !emailValid;
        if (!editEmail.value) fieldErrors[1].value = !phoneValid;
        if (fieldErrors.contains(true.obs)) return loading.value = false;
        var user = storage.user.value.copyWith(
          email: fieldControllers[0].text,
          phone: fieldControllers[1].text,
        );
        storage
            .upsertUser(user)
            .then((_) => storage.fetchSingleUser(user.id!))
            .then((user) => storage.user.value = user!)
            .then((_) => loading.value = false)
            .then((_) => Get.back());
        storage.listUser.assignAll(await storage.fetchAllUser());
      });
    });
  }

  Future<void> onDeleteUser() async {
    loading.value = true;
    await storage.removePrefLanguage();
    await storage.removeLoggedUser();
    await storage.deleteUser(storage.user.value.id!);
    storage.listUser.assignAll(await storage.fetchAllUser());
    loading.value = false;
    await Get.offAllNamed("/welcome");
  }

  Future<void> onSignOutUser(int index) async {
    if (index != 6) return;
    loading.value = true;
    await storage.removeLoggedUser();
    storage.listUser.assignAll(await storage.fetchAllUser());
    loading.value = false;
    await Get.offAllNamed("/welcome")!.then((_) => app.screenIndex.value = 0);
  }

  void onLanguageChanged(bool id) {
    var language = id ? 0 : 1;
    storage.savePrefLanguage(language);
  }
}
