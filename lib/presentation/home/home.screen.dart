import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          Get.arguments == 0 ? "bekerja" : 'HomeScreen is working',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
